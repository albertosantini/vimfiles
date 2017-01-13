setlocal suffixesadd=.js

autocmd BufWritePost <buffer> compiler javascript | Make %
autocmd QuickFixCmdPost <buffer> nested cwindow

abbreviate <buffer> con console.log()<esc>
abbreviate <buffer> f function () {}<esc>
abbreviate <buffer> fun function foo() {<cr>}<esc>?foo<cr>
abbreviate <buffer> use "use strict";<cr>
