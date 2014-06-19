set laststatus=2
set noshowmode

let s:statusline = ""
let s:statusline .= "%7*%7{statusline#mode()}%*"  "mode
let s:statusline .= "%1* %n %*"                   "buffer number
let s:statusline .= "%5*%{&ff} %*"                "file format
let s:statusline .= "%6*%{fugitive#statusline()}" "git branch
let s:statusline .= "%3*%y%*"                     "file type
let s:statusline .= "%4* %<%F%*"                  "full path
let s:statusline .= "%2*%m%*"                     "modified flag
let s:statusline .= "%1*%=%5l:%v %*"              "current line and column
let s:statusline .= "%2*%L%*"                     "total lines

let s:color_normal  = "guifg=#7DCC7D guibg=#000000"
let s:color_insert  = "guifg=#FF0000 guibg=#000000"
let s:color_replace = "guifg=#5B7FBB guibg=#000000"
let s:color_visual  = "guifg=#810085 guibg=#000000"

let s:repo_clean = "guifg=#5B7FBB guibg=#000000"
let s:repo_dirty = "guifg=#FF0000 guibg=#000000"

function! statusline#mode()
    redraw
    let l:mode = mode()

    if     mode ==# "n"  | exec "hi User7 ".s:color_normal  | return "NORMAL"
    elseif mode ==# "i"  | exec "hi User7 ".s:color_insert  | return "INSERT"
    elseif mode ==# "R"  | exec "hi User7 ".s:color_replace | return "REPLACE"
    elseif mode ==# "c"  | exec "hi User7 ".s:color_normal  | return "COMMAND"
    elseif mode ==# "s"  | exec "hi User7 ".s:color_visual  | return "SELECT"
    elseif mode ==# "v"  | exec "hi User7 ".s:color_visual  | return "VISUAL"
    elseif mode ==# "V"  | exec "hi User7 ".s:color_visual  | return "VLINE"
    elseif mode ==# "" | exec "hi User7 ".s:color_visual  | return "VBLOCK"
    else                 | return l:mode
    endif
endfunction

function! statusline#colors()
    exec "highlight User1 guifg=#EEA040 guibg=#000000"
    exec "highlight User2 guifg=#DD3333 guibg=#000000"
    exec "highlight User3 guifg=#FF66FF guibg=#000000"
    exec "highlight User4 guifg=#A0EE40 guibg=#000000"
    exec "highlight User5 guifg=#EEEE40 guibg=#000000"
endfunction

autocmd! ColorScheme * call statusline#colors()

function! statusline#repo()
    let l:branch = fugitive#statusline()

    if !empty(l:branch)
        if !empty(glob("%:p:h"))
            exec "cd %:p:h"
        endif
        if !empty(system("git status --porcelain"))
            exec "hi User6 ".s:repo_dirty
        else
            exec "hi User6 ".s:repo_clean
        endif
    endif

    return l:branch
endfunction

autocmd! BufEnter,BufWritePost * call statusline#repo()

autocmd! WinEnter,BufWinEnter *
    \ call setwinvar(0, "&statusline", s:statusline)
autocmd! WinLeave *
    \ exec "hi StatusLineNC guifg=#333333 guibg=#BBBBBB" |
    \ call setwinvar(0, "&statusline", "")
