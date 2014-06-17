set laststatus=2
set noshowmode

set statusline=
set statusline +=%7*%7{statusline#mode()}%*     "mode
set statusline +=%1*\ %n\ %*                    "buffer number
set statusline +=%5*%{&ff}\ %*                  "file format
set statusline +=%6*%{fugitive#statusline()}    "git branch
set statusline +=%3*%y%*                        "file type
set statusline +=%4*\ %<%F%*                    "full path
set statusline +=%2*%m%*                        "modified flag
set statusline +=%1*%=%5l/%*                    "current line
set statusline +=%2*%L%*                        "total lines
set statusline +=%1*,%v\ %*                     "virtual column number

let s:color_normal  = "guifg=#7DCC7D guibg=#000000"
let s:color_insert  = "guifg=#FF0000 guibg=#000000"
let s:color_replace = "guifg=#5B7FBB guibg=#000000"
let s:color_visual  = "guifg=#810085 guibg=#000000"

let s:repo_ok = "guifg=#5B7FBB guibg=#000000"
let s:repo_ko = "guifg=#FF0000 guibg=#000000"

function! statusline#mode()
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
    let branch = fugitive#statusline()

    if !empty(branch) | exec "cd %:p:h" | let status = system("git status --porcelain")
    else              | let status = ""
    endif

    if empty(status) | exec "hi User6 ".s:repo_ok
    else             | exec "hi User6 ".s:repo_ko
    endif

    return branch
endfunction

autocmd! BufEnter,BufWritePost * call statusline#repo()

