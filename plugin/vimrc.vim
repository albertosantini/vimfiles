set nocompatible
set encoding=utf-8

syntax on
filetype plugin indent on

set autochdir
set autoindent
set autoread
set expandtab
set hidden
set hlsearch
set ignorecase
set incsearch
set list listchars=tab:>-,trail:$
set nobackup
set nojoinspaces
set nomodeline
set noswapfile
set nowrap
set scrolloff=3
set shiftwidth=4
set showmatch
set smartcase
set smartindent
set smarttab
set softtabstop=4
set tabstop=4
set viminfo+=%
set virtualedit=block
set visualbell

nnoremap <f2> :ls<cr>
nnoremap <f4> :cw<cr>:cn<cr>
nnoremap <s-f4> :cw<cr>:cp<cr>
nnoremap <f6> :bn<cr>
nnoremap <s-f6> :bp<cr>
nnoremap <esc> :nohlsearch<cr>
nnoremap gp `[v`]
vnoremap < <gv
vnoremap > >gv

autocmd! BufWrite * if ! &bin | :%s/\s\+$//ge | endif
autocmd! VimEnter * nested if empty(expand('%')) | keepalt bd | endif
