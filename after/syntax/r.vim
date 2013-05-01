if !exists("b:current_syntax")
    finish
endif

syntax match rLineOverflow "\%>80v.\+" containedin=ALL

highlight link rLineOverflow ErrorMsg
