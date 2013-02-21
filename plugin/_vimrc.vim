" My Environment
set nocompatible
set encoding=utf-8

set runtimepath+=~/vimfiles/bundle/tcomment_vim
set runtimepath+=~/vimfiles/bundle/vim-surround

runtime! bundle/**/plugin/*.vim

let mapleader=","

" General
syntax on
filetype plugin indent on

set autochdir
set autoread
set hidden
set history=100
set modelines=1
set nobackup
set noswapfile
set suffixesadd+=.js
set undolevels=1000
set viminfo+=%

" UI
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

" Formatting
set autoindent
set expandtab
set nowrap
set shiftwidth=4
set smartindent
set softtabstop=4
set tabstop=4
set textwidth=80

" Mappings
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

" Auto Commands
augroup myautocmd
autocmd!

autocmd VimEnter * nested if empty(expand('%')) | keepalt bd | endif
autocmd BufEnter * :syntax sync fromstart
autocmd BufWrite * if ! &bin | :%s/\s\+$//ge | endif
autocmd BufWritePost _vimrc.vim source %
autocmd QuickFixCmdPost *grep* cwindow
autocmd FileType qf,help nnoremap <buffer> <silent> q :bd<cr>

augroup end

" GUI
if has('gui_running')
    colorscheme as
endif
