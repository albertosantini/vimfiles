setlocal suffixesadd=.js

compiler javascript

autocmd BufWritePost <buffer> silent make
autocmd QuickFixCmdPost <buffer> nested cwindow

autocmd BufWinEnter,WinEnter *
    \ if &ft == "javascript" | match ErrorMsg '\%>80v.\+' |
    \ else | match none | endif

inoremap <buffer> {<cr> {<cr>}<Esc>O
inoremap <buffer> { {}<Esc>a<Left>
inoremap <buffer> ( ()<Esc>a<Left>
inoremap <buffer> [ []<Esc>a<Left>
inoremap <buffer> " ""<Esc>a<Left>
inoremap <buffer> ' ''<Esc>a<Left>
inoremap <buffer> <C-Tab> <Esc><Right>a
