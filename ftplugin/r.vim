compiler r
nnoremap <buffer> <f8> :silent make<cr>:copen 21<cr>

inoremap <buffer> {<cr> {<cr>}<Esc>O
inoremap <buffer> { {}<Esc>a<Left>
inoremap <buffer> ( ()<Esc>a<Left>
inoremap <buffer> [ []<Esc>a<Left>
inoremap <buffer> " ""<Esc>a<Left>
inoremap <buffer> ' ''<Esc>a<Left>
inoremap <buffer> <C-Tab> <Esc><Right>a
