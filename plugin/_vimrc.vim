set nocompatible
set encoding=utf-8

set runtimepath+=~/vimfiles/bundle/tcomment_vim
set runtimepath+=~/vimfiles/bundle/vim-surround

runtime! bundle/**/plugin/*.vim

syntax on
filetype plugin indent on

colorscheme as

set autochdir
set autoindent
set autoread
set expandtab
set hidden
set hlsearch
set ignorecase
set incsearch
set list
set listchars=tab:>-,trail:$
set nobackup
set nojoinspaces
set nomodeline
set noswapfile
set nowrap
set number
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
nnoremap <f5> :!start cmd /c %:p<cr>
nnoremap <f6> :bn<cr>
nnoremap <s-f6> :bp<cr>
nnoremap <f9> :nohlsearch<cr>
nnoremap <f10> :e! ~/vimfiles/plugin/_vimrc.vim<cr>
nnoremap gp `[v`]
vnoremap < <gv
vnoremap > >gv

augroup myautocmd
autocmd!
autocmd BufWrite * if ! &bin | :%s/\s\+$//ge | endif
autocmd BufWritePost _vimrc.vim source %
autocmd QuickFixCmdPost *grep* cwindow
autocmd VimEnter * nested if empty(expand('%')) | keepalt bd | endif
augroup end
