" C:\My\Programs\Vim\vim73\gvim.exe +bd -u %USERPROFILE%/vimfiles/_vimrc

set nocompatible
set encoding=utf-8

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

syntax on
syntax sync fromstart
filetype plugin indent on

let $MYVIMRC="~/vimfiles/_vimrc"

set shell=C:/My/Programs/Git/bin/bash
set shellcmdflag=--login\ -c
set shellslash

nmap <f12> :!start C:\My\Programs\Git\bin\sh --login -i<cr>

augroup vimrc
autocmd!
autocmd FileType text setlocal textwidth=78
autocmd BufWritePost _vimrc source %
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   execute "normal! g`\"" |
\ endif
augroup END

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
      \ | wincmd p | diffthis
endif

source $VIMRUNTIME/mswin.vim
behave mswin

let g:snippets_dir='$HOME/vimfiles/snippets'

winpos 25 100

set modelines=0

set viminfo+=%

set list
set listchars=tab:>-,trail:$

set backspace=indent,eol,start
set history=1000
set undolevels=1000
set visualbell

set hidden
set nobackup
set noswapfile

set autoread
set autochdir
set wildignore=.exe

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guifont=Lucida_Console

set number
set nowrap
set lines=51
set columns=100
set colorcolumn=80
set cmdheight=2
set noshowcmd

set printoptions=paper:a4,syntax:n

set laststatus=2
set statusline=
set statusline+=%<%f\ %h%m%r%w%{fugitive#statusline()}\ %y:b%n
set statusline+=%=
set statusline+=%-14.(%l,%c%V%)\ %P
autocmd! InsertEnter * set cursorline
autocmd! InsertLeave * set nocursorline

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent

let mapleader=","

map Q gq
inoremap <C-U> <C-G>u<C-U>

inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

nmap <f4> :cw<cr>:cn<cr>
nmap <s-f4> :cw<cr>:cp<cr>
nmap <f5> :!start cmd /c %:p<cr>
nmap <f6> :bn<cr>
nmap <s-f6> :bp<cr>
nmap <leader>e :e! $MYVIMRC<cr>

nnoremap ; :
nnoremap <leader><space> :nohlsearch<cr>
nnoremap <leader>gd :DiffOrig<cr>
nnoremap <leader>gD :diffoff!<cr><c-w>h:bd<cr>
nnoremap j gj
nnoremap k gk

vnoremap < <gv
vnoremap > >gv

augroup dev
autocmd!

autocmd BufRead,BufNewFile *.html inoremap <buffer> < <><Esc>a<Left>
autocmd BufRead,BufNewFile *.html,*.js,*.json,*.R,*.m
            \ inoremap <buffer> ( ()<Esc>a<Left>
autocmd BufRead,BufNewFile *.html,*.js,*,json,*.R,*.m
            \ inoremap <buffer> [ []<Esc>a<Left>
autocmd BufRead,BufNewFile *.html,*.js,*,json,*.R,*.m
            \ inoremap <buffer> " ""<Esc>a<Left>
autocmd BufRead,BufNewFile *.html,*.js,*,json,*.R,*.m
            \ inoremap <buffer> ' ''<Esc>a<Left>
autocmd BufRead,BufNewFile *.html,*.js,*,json,*.R,*.m
            \ inoremap <buffer> <C-Tab> <Esc><Right>a

autocmd BufRead,BufNewFile *.js set nocindent

autocmd BufRead,BufNewFile *.html,*.js,*.json
            \ setlocal makeprg=node\ C:/My/Programs/Zapps/lint.js\ %
autocmd BufRead,BufNewFile *.html,*.js,*.json set efm=%f:%l:%m
autocmd BufRead,BufNewFile *.html,*.js,*.json
            \ nnoremap <buffer> <leader>m
                \ :silent make<cr>:cw<cr>:cc<cr>

autocmd BufReadPost quickfix nnoremap <buffer> <silent> q :bd<CR>

autocmd BufRead,BufNewFile *.json set filetype=javascript

autocmd BufRead,BufNewFile *.R set filetype=R
autocmd BufRead,BufNewFile *.R let &l:commentstring='# %s'
autocmd BufRead,BufNewFile *.R
            \ nnoremap <buffer> <leader>r
                \ :Shell c:/My/Programs/R/R-2.15.0/bin/i386/Rscript.exe %<cr>

autocmd BufWrite *.html,*.js,*,json,*.R,*.m :%s/\s\+$//ge

augroup END

set background=dark
highlight clear
syntax reset
highlight Normal guifg=White guibg=Black
highlight ColorColumn guibg=#2d2d2d
highlight Cursor guifg=Black guibg=Red
highlight CursorLine guibg=black gui=undercurl
highlight Search guibg=White
highlight Boolean guifg=Yellow gui=NONE
highlight Comment guifg=Magenta gui=NONE
highlight Conditional guifg=Red gui=NONE
highlight Constant guifg=Yellow gui=NONE
highlight Float guifg=LightYellow gui=NONE
highlight Function guifg=Orange gui=NONE
highlight Identifier guifg=LightRed gui=NONE
highlight Keyword guifg=Red gui=NONE
highlight Label guifg=LightRed gui=NONE
highlight Number guifg=LightYellow gui=NONE
highlight Operator guifg=Red gui=NONE
highlight Repeat guifg=Red gui=NONE
highlight Special guifg=Red gui=NONE
highlight Statement guifg=Red gui=NONE
highlight String guifg=Green gui=NONE
highlight Type guifg=Orange gui=NONE

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Display output of shell commands in new window
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
    " echo a:cmdline
    let exp_cmdline = a:cmdline
    for part in split(a:cmdline, ' ')
        if part[0] =~ '\v[%#<]'
            let exp_part = fnameescape(expand(part))
            let exp_cmdline = substitute(exp_cmdline, part, exp_part, '')
        endif
    endfor
    botright new
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
    " call setline(1, 'You entered:    ' . a:cmdline)
    " call setline(2, 'Expanded Form:  ' .expanded_cmdline)
    " call setline(3,substitute(getline(2),'.','=','g'))
    execute '$read !'. exp_cmdline
    setlocal nomodifiable
    nnoremap <buffer> <silent> q :bd<CR>
    1
endfunction

