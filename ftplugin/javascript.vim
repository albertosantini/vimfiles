setlocal suffixesadd=.js

compiler javascript

autocmd BufWritePost <buffer> silent make
autocmd QuickFixCmdPost <buffer> nested cwindow
