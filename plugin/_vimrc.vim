" vim: set foldlevel=0 foldmethod=marker :

" My Environment {{{
set nocompatible
set encoding=utf-8

let $PATH=$PATH . ";c:/My/Programs/R/R-2.15.2/bin/i386"

set runtimepath+=~/vimfiles/bundle/tcomment_vim
set runtimepath+=~/vimfiles/bundle/vim-surround

runtime! bundle/**/plugin/*.vim
" }}}

" General {{{
syntax on
filetype plugin indent on

set autochdir
set autoread
set hidden
set history=1000
set modelines=1
set nobackup
set noswapfile
set printoptions=paper:a4,syntax:n
set suffixesadd+=.js
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
set linespace=0
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
set autoindent
set expandtab
set nowrap
set shiftwidth=4
set smartindent
set softtabstop=4
set tabstop=4
set textwidth=80
" }}}

" Mappings {{{
let mapleader=","

map Q gq
inoremap <C-U> <C-G>u<C-U>

nmap <f4> :cw<cr>:cn<cr>
nmap <s-f4> :cw<cr>:cp<cr>
nmap <f5> :!start cmd /c %:p<cr>
nmap <f6> :bn<cr>
nmap <s-f6> :bp<cr>
nmap <leader>e :e! ~/vimfiles/plugin/_vimrc.vim<cr>

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
augroup myautocmd
autocmd!

autocmd VimEnter * nested if empty(expand('%')) | keepalt bd | endif
autocmd BufEnter * :syntax sync fromstart
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif
autocmd BufWrite * if ! &bin | :%s/\s\+$//ge | endif
autocmd BufWritePost _vimrc.vim source %

autocmd FileType html inoremap <buffer> < <><Esc>a<Left>

autocmd FileType javascript,html,css,R inoremap <buffer> {<cr> {<cr>}<Esc>O
autocmd FileType javascript,html,css,R inoremap <buffer> { {}<Esc>a<Left>
autocmd FileType javascript,html,R inoremap <buffer> ( ()<Esc>a<Left>
autocmd FileType javascript,html,R inoremap <buffer> [ []<Esc>a<Left>
autocmd FileType javascript,html,R inoremap <buffer> " ""<Esc>a<Left>
autocmd FileType javascript,html,R inoremap <buffer> ' ''<Esc>a<Left>
autocmd FileType javascript,html,R inoremap <buffer> <C-Tab> <Esc><Right>a

autocmd FileType javascript setlocal nocindent
autocmd FileType javascript setlocal makeprg=jshint\ %
autocmd FileType javascript setlocal efm=%f:\ line\ %l\\,\ col\ %c\\,\ %m
autocmd FileType javascript nnoremap <buffer> <leader>m
                \ :silent make<cr>:cw<cr>:cc<cr>

autocmd FileType R let &l:commentstring='# %s'
autocmd FileType R setlocal makeprg=Rscript.exe\ %
autocmd FileType R setlocal efm=%A,%C,%Z
autocmd FileType R nnoremap <buffer> <leader>m
                \ :silent make<cr>:copen 21<cr>

autocmd BufRead,BufNewFile *.json,*-js.mustache setlocal filetype=javascript
autocmd BufRead,BufNewFile *-html.mustache setlocal filetype=html
autocmd BufRead,BufNewFile *.R setlocal filetype=R

autocmd QuickFixCmdPost *grep* cwindow
autocmd FileType qf,help nnoremap <buffer> <silent> q :bd<cr>

augroup end
" }}}

" GUI {{{
if has('gui')
    winpos 25 50

    set guioptions=
    set guifont=Source_Code_Pro:h9

    set lines=51
    set columns=100

    source $VIMRUNTIME/mswin.vim
    behave mswin

    set background=dark
    highlight clear
    highlight Normal guifg=White guibg=Black
    highlight ColorColumn guibg=#2D2D2D
    highlight Cursor guifg=Black guibg=Red
    highlight LineNr guifg=DarkGrey
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
" }}}
