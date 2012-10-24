" vim: set foldlevel=0 foldmethod=marker :

" Environment {{{
set nocompatible
set encoding=utf-8
" }}}

" Pathogen {{{
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
" }}}

" General {{{
syntax on
syntax sync fromstart
filetype plugin indent on

set autochdir
set autoread
set hidden
set history=1000
set modelines=1
set nobackup
set noswapfile
set printoptions=paper:a4,syntax:n
set undolevels=1000
set viminfo+=%
" }}}

" UI {{{
set backspace=indent,eol,start
set cmdheight=1
set colorcolumn=80
set hlsearch
set ignorecase
set incsearch
set laststatus=1
set linespace=1
set list
set listchars=tab:>-,trail:$
set nofoldenable
set nojoinspaces
set noshowcmd
set noshowmode
set number
set showmatch
set smartcase
set smarttab
set statusline=
set statusline+=%<%f\ %h%m%r%w\ %y:b%n
set statusline+=%=
set statusline+=%-14.(%l,%c%V%)\ %P
set virtualedit=block
set visualbell
set wildignore=.exe
" }}}

" Formatting {{{
set nowrap
set autoindent
set shiftwidth=4
set expandtab
set paste
set tabstop=4
set textwidth=80
set softtabstop=4
" }}}

" Mappings {{{
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
nnoremap j gj
nnoremap k gk
nnoremap gp `[v`]
nnoremap <leader>l :ls<cr>
nnoremap <leader><space> :nohlsearch<cr>

vnoremap < <gv
vnoremap > >gv
" }}}

" Auto Commands {{{
autocmd BufWritePost _vimrc source %
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif

autocmd FileType html inoremap <buffer> < <><Esc>a<Left>

autocmd FileType javascript,html,css,R inoremap <buffer> {<cr> {<cr>}<Esc>O<tab>
autocmd FileType javascript,html,css,R inoremap <buffer> { {}<Esc>a<Left>
autocmd FileType javascript,html,R inoremap <buffer> ( ()<Esc>a<Left>
autocmd FileType javascript,html,R inoremap <buffer> [ []<Esc>a<Left>
autocmd FileType javascript,html,R inoremap <buffer> " ""<Esc>a<Left>
autocmd FileType javascript,html,R inoremap <buffer> ' ''<Esc>a<Left>
autocmd FileType javascript,html,R inoremap <buffer> <C-Tab> <Esc><Right>a

autocmd FileType javascript setlocal nocindent

autocmd FileType javascript,html
            \ setlocal makeprg=node\ \"$HOME/vimfiles/jslint.js\"\ %
autocmd FileType javascript,html setlocal efm=%f:%l:%m
autocmd FileType javascript,html
            \ nnoremap <buffer> <leader>m
                \ :silent make<cr>:cw<cr>:cc<cr>

autocmd FileType R let &l:commentstring='# %s'
autocmd FileType R
            \ nnoremap <buffer> <leader>r
                \ :Shell c:/My/Programs/R/R-2.15.1/bin/i386/Rscript.exe %<cr>

autocmd BufRead,BufNewFile *.json,*-js.mustache,*.ts
            \ setlocal filetype=javascript
autocmd BufRead,BufNewFile *-html.mustache setlocal filetype=html
autocmd BufRead,BufNewFile *.R setlocal filetype=R

autocmd FileType qf nnoremap <buffer> <silent> q :bd<cr>

autocmd QuickFixCmdPost *grep* cwindow

autocmd InsertEnter * setlocal cursorline
autocmd InsertLeave * setlocal nocursorline

autocmd BufWrite * if ! &bin | :%s/\s\+$//ge | endif
" }}}

" GUI {{{
if has('gui')
    winpos 25 100

    set guioptions-=m
    set guioptions-=T
    set guioptions-=r

    set guifont=Lucida_Console

    set lines=51
    set columns=100

    source $VIMRUNTIME/mswin.vim
    behave mswin

    set background=dark
    highlight clear
    highlight Normal guifg=White guibg=Black
    highlight ColorColumn guibg=#2D2D2D
    highlight Cursor guifg=Black guibg=Red
    highlight CursorLine guibg=Black gui=undercurl
    highlight Search guibg=White
    highlight Title guifg=Orange gui=bold
    highlight Visual guifg=Blue
    highlight Boolean guifg=Yellow gui=none
    highlight Comment guifg=DarkGrey gui=none
    highlight Conditional guifg=Magenta gui=none
    highlight Constant guifg=LightYellow gui=none
    highlight Float guifg=LightYellow gui=none
    highlight Function guifg=Orange gui=none
    highlight Identifier guifg=Red gui=none
    highlight Keyword guifg=Red gui=none
    highlight Label guifg=Orange gui=none
    highlight Number guifg=LightYellow gui=none
    highlight Operator guifg=LightBlue gui=none
    highlight Repeat guifg=Red gui=none
    highlight Special guifg=LightRed gui=none
    highlight Statement guifg=Red gui=none
    highlight String guifg=#A5C261 gui=none
    highlight Type guifg=LightRed gui=none
endif
" }}}

" Util {{{
" Display the syntax name under the cursor
nmap <C-S-P> :echo synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")<cr>

" Display output of shell commands in new window
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
    let exp_cmdline = a:cmdline
    for part in split(a:cmdline, ' ')
        if part[0] =~ '\v[%#<]'
            let exp_part = fnameescape(expand(part))
            let exp_cmdline = substitute(exp_cmdline, part, exp_part, '')
        endif
    endfor
    botright new
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
    execute '$read !'. exp_cmdline
    setlocal nomodifiable
    nnoremap <buffer> <silent> q :bd<CR>
    1
endfunction
" }}}
