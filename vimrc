filetype plugin indent on

set autochdir
set autoindent
set autoread
set encoding=utf-8
set expandtab
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
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

autocmd! BufWrite * if ! &bin | :%s/\s\+$//ge | endif
autocmd! VimEnter * nested if empty(expand('%')) | keepalt bd | endif
autocmd! QuickFixCmdPost *grep* cwindow
