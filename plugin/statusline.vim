set laststatus=2
set noshowmode

set statusline=
set statusline +=%7*%{MyMode()}%*               "mode
set statusline +=%1*\ %n\ %*                    "buffer number
set statusline +=%5*%{&ff}\ %*                  "file format
set statusline +=%6*%{fugitive#statusline()}    "git branch
set statusline +=%3*%y%*                        "file type
set statusline +=%4*\ %<%F%*                    "full path
set statusline +=%2*%m%*                        "modified flag
set statusline +=%1*%=%5l%*                     "current line
set statusline +=%2*/%L%*                       "total lines
set statusline +=%1*,%v\ %*                     "virtual column number

let s:color_normal  = "guibg=#000000 guifg=#7dcc7d"
let s:color_insert  = "guibg=#000000 guifg=#ff0000"
let s:color_replace = "guibg=#000000 guifg=#5b7fbb"
let s:color_visual  = "guibg=#000000 guifg=#810085"

function! MyMode()
    redraw
    let l:mode = mode()

    if     mode ==# "n"  | exec "hi User7 ".s:color_normal  | return "NORMAL"
    elseif mode ==# "i"  | exec "hi User7 ".s:color_insert  | return "INSERT"
    elseif mode ==# "R"  | exec "hi User7 ".s:color_replace | return "REPLACE"
    elseif mode ==# "v"  | exec "hi User7 ".s:color_visual  | return "VISUAL"
    elseif mode ==# "V"  | exec "hi User7 ".s:color_visual  | return "VLINE"
    elseif mode ==# " "  | exec "hi User7 ".s:color_visual  | return "VBLOCK"
    else                 | return l:mode
    endif
endfunc

function! MyStatusLineDefaultColors()
    exec "highlight User1 guifg=#EEA040 guibg=#000000"
    exec "highlight User2 guifg=#DD3333 guibg=#000000"
    exec "highlight User3 guifg=#FF66FF guibg=#000000"
    exec "highlight User4 guifg=#A0EE40 guibg=#000000"
    exec "highlight User5 guifg=#EEEE40 guibg=#000000"
    exec "highlight User6 guifg=#5B7FBB guibg=#000000"
endfunc

autocmd! ColorScheme * call MyStatusLineDefaultColors()

