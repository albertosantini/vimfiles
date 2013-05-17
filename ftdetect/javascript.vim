autocmd BufNewFile,BufRead *.json setfiletype javascript
autocmd BufNewFile,BufRead *-js.mustache setfiletype javascript
autocmd BufNewFile,BufRead .jshintrc setfiletype javascript

function! s:SelectJavascript()
    if getline(1) =~# '^#!.*/bin/env\s\+node\>'
        setfiletype javascript
    endif
endfun
au BufNewFile,BufRead * call s:SelectJavascript()

