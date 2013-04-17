if !has('gui_running')
    finish
endif

winpos 25 25

set columns=100
set guioptions=
set guifont=Source_Code_Pro:h9
set lines=51
set nomousehide

source $VIMRUNTIME/mswin.vim

noremap <2-LeftMouse> *
