set nocompatible
set encoding=utf-8

set runtimepath+=~/vimfiles/bundle/tcomment_vim
set runtimepath+=~/vimfiles/bundle/vim-surround

runtime! bundle/**/plugin/*.vim

let mapleader=","

syntax on
filetype plugin indent on

set autochdir
set autoindent
set autoread
set backspace=indent,eol,start
set cmdheight=1
set colorcolumn=80
set expandtab
set hidden
set history=100
set hlsearch
set ignorecase
set incsearch
set laststatus=1
set linespace=0
set list
set listchars=tab:>-,trail:$
set modelines=1
set nobackup
set nofoldenable
set nojoinspaces
set noswapfile
set noshowcmd
set noshowmode
set nowrap
set number
set shiftwidth=4
set showmatch
set smartcase
set smartindent
set smarttab
set softtabstop=4
set statusline=
set statusline+=%<%f\ %h%m%r%w\ %y:b%n
set statusline+=%=
set statusline+=%-14.(%l,%c%V%)\ %P
set suffixesadd+=.js
set tabstop=4
set textwidth=80
set undolevels=1000
set virtualedit=block
set viminfo+=%
set visualbell
set wildignore=.exe

map Q gq
inoremap <C-U> <C-G>u<C-U>

nmap <f4> :cw<cr>:cn<cr>
nmap <s-f4> :cw<cr>:cp<cr>
nmap <f5> :!start cmd /c %:p<cr>
nmap <f6> :bn<cr>
nmap <s-f6> :bp<cr>
nmap <leader>e :e! ~/vimfiles/plugin/_vimrc.vim<cr>

nnoremap ; :
nnoremap gp `[v`]
nnoremap <leader>l :ls<cr>
nnoremap <leader><space> :nohlsearch<cr>

vnoremap < <gv
vnoremap > >gv

augroup myautocmd
autocmd!

autocmd VimEnter * nested if empty(expand('%')) | keepalt bd | endif
autocmd BufEnter * :syntax sync fromstart
autocmd BufWrite * if ! &bin | :%s/\s\+$//ge | endif
autocmd BufWritePost _vimrc.vim source %
autocmd QuickFixCmdPost *grep* cwindow
autocmd FileType qf,help nnoremap <buffer> <silent> q :bd<cr>

augroup end

if has('gui_running')
    colorscheme as
endif
