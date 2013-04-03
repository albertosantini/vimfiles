set nocompatible
set encoding=utf-8

set runtimepath+=~/vimfiles/bundle/tcomment_vim
set runtimepath+=~/vimfiles/bundle/vim-surround

runtime! bundle/**/plugin/*.vim

syntax on
filetype plugin indent on

if has('gui_running') | colorscheme as | endif

set autochdir
set autoindent
set autoread
set cmdheight=1
set expandtab
set hidden
set history=100
set hlsearch
set ignorecase
set incsearch
set laststatus=1
set list
set listchars=tab:>-,trail:$
set nomodeline
set nobackup
set nojoinspaces
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
set undolevels=1000
set virtualedit=block
set viminfo+=%
set visualbell
set wildignore=.exe

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
autocmd BufEnter * :syntax sync fromstart
autocmd BufWrite * if ! &bin | :%s/\s\+$//ge | endif
autocmd BufWritePost _vimrc.vim source %
autocmd FileType qf,help nnoremap <buffer> <silent> q :bd<cr>
autocmd QuickFixCmdPost *grep* cwindow
autocmd VimEnter * nested if empty(expand('%')) | keepalt bd | endif
augroup end
