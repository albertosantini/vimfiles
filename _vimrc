" C:\My\Programs\Vim\vim73\gvim.exe +bd -u %USERPROFILE%/vimfiles/_vimrc
 
set nocompatible

set runtimepath+=$USERPROFILE/vimfiles/bundle/vim-pathogen
call pathogen#runtime_append_all_bundles() 
call pathogen#helptags()
filetype plugin indent on

let $MYVIMRC="$HOME/vimfiles/_vimrc"

let $PATH=$PATH . ";C:/My/Programs/Git/bin;C:/My/Programs/Ant/bin"
let $JAVA_HOME="C:\\Program Files (x86)\\Java\\jdk1.6.0_24"

augroup vimrc
autocmd!
autocmd FileType text setlocal textwidth=78
autocmd BufWritePost $MYVIMRC source $MYVIMRC
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

runtime plugin/fugitive.vim
let g:fugitive_git_executable='C:/My/Programs/Git/bin/git'

let g:NERDSpaceDelims=1

winpos 25 100

set modelines=0

set viminfo+=%

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

set nowrap
set lines=48
set columns=100
set colorcolumn=80
set printoptions=paper:a4,syntax:n 

set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set number
set showcmd
set incsearch

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set smartindent
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
nmap <f12> :!start cmd /f<cr>
nmap <leader>e :e! $MYVIMRC<cr>

nnoremap ; :
nnoremap <leader><space> :nohlsearch<cr>
nnoremap <leader>gd :DiffOrig<cr> 
nnoremap <leader>gD :diffoff!<cr><c-w>h:bd<cr>
nnoremap j gj
nnoremap k gk

vnoremap < <gv
vnoremap > >gv

autocmd! BufNewFile * silent! 0r $HOME/vimfiles/skel/tmpl.%:e

augroup web
autocmd!
autocmd BufRead,BufNewFile *.html,*.js set makeprg=java\ -jar\ \"C:\My\Programs\JSLint\js.jar\"\ \"C:\My\Programs\JSLint\jslint.js\"\ \"%\"
autocmd BufRead,BufNewFile *.html,*.js set efm=%f:%l:%m
autocmd BufRead,BufNewFile *.html,*.js nmap <buffer> <leader>m :silent make<cr>:cw<cr>:cc<cr>
autocmd BufWrite *.js :%s/\s\+$//ge
augroup END
 
augroup rproject
autocmd!
autocmd BufRead,BufNewFile *.R set filetype=R
autocmd BufRead,BufNewFile *.R let &l:commentstring='#%s'
autocmd BufWrite *.R :%s/\s\+$//ge
augroup END

syntax on
syntax sync fromstart

set background=dark
highlight clear
syntax reset
highlight Normal guifg=White   guibg=Black
highlight Cursor guifg=Black   guibg=Red
highlight Keyword guifg=#FF6600
highlight Comment guifg=#9933CC
highlight Type guifg=White gui=NONE
highlight Identifier guifg=White gui=NONE
highlight Constant guifg=#FFEE98
highlight Function guifg=#FFCC00 gui=NONE
highlight Statement guifg=#FF6600 gui=NONE
highlight String guifg=Green
highlight Search guibg=White
highlight CursorLine guibg=#323300
highlight ColorColumn guibg=#2d2d2d
