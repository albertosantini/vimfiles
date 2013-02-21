let $PATH=$PATH . ";c:/My/Programs/R/R-2.15.2/bin/i386"

setlocal makeprg=Rscript\ %
setlocal errorformat=%A,%C,%Z

nnoremap <buffer> <leader>m :silent make<cr>:copen 21<cr>

inoremap <buffer> {<cr> {<cr>}<Esc>O
inoremap <buffer> { {}<Esc>a<Left>
inoremap <buffer> ( ()<Esc>a<Left>
inoremap <buffer> [ []<Esc>a<Left>
inoremap <buffer> " ""<Esc>a<Left>
inoremap <buffer> ' ''<Esc>a<Left>
inoremap <buffer> <C-Tab> <Esc><Right>a
