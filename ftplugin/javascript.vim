setlocal nocindent

setlocal makeprg=jshint\ %
setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m

nnoremap <buffer> <leader>m :silent make<cr>:cw<cr>:cc<cr>

inoremap <buffer> {<cr> {<cr>}<Esc>O
inoremap <buffer> { {}<Esc>a<Left>
inoremap <buffer> ( ()<Esc>a<Left>
inoremap <buffer> [ []<Esc>a<Left>
inoremap <buffer> " ""<Esc>a<Left>
inoremap <buffer> ' ''<Esc>a<Left>
inoremap <buffer> <C-Tab> <Esc><Right>a
