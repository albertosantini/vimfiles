if !exists("b:current_syntax")
    finish
endif

syntax match htmlLineOverflow "\%>80v.\+" containedin=ALL

highlight link htmlLineOverflow ErrorMsg
