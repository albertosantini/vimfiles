if !has('gui_running')
    finish
endif

colorscheme as

winpos 25 25

set columns=100

set guioptions=
set lines=51
set nomousehide

source $VIMRUNTIME/mswin.vim

noremap <2-LeftMouse> *
