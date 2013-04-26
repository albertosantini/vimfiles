if !exists("b:current_syntax")
    finish
endif

syntax clear javaScriptFunction

syntax keyword javaScriptFuncKeyword function contained
syntax region javaScriptFuncDef start="function" end="\([^)]*\)"
                \ contains=javaScriptFuncKeyword,javaScriptFuncArg keepend
syntax match javaScriptFuncArg "\(([^()]*)\)"
                \ contains=javaScriptParens,javaScriptFuncComma contained
syntax match javaScriptFuncComma /,/ contained

syntax match javaScriptEndColons "[;,]"
syntax match javaScriptLabel /\(?\s*\)\@<!\<\w\+\(\s*:\)\@=/
syntax match javaScriptLogicSymbols "\(&&\)\|\(||\)"
syntax match javaScriptNumber "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syntax match javaScriptOpSymbols
                \ "=\{1,3}\|!==\|!=\|<\|>\|>=\|<=\|++\|+=\|--\|-="

syntax match javaScriptLineOverflow "\%>80v.\+" containedin=ALL

highlight link javaScriptEndColons Exception
highlight link javaScriptFuncArg Special
highlight link javaScriptFuncComma Operator
highlight link javaScriptFuncDef Title
highlight link javaScriptFuncKeyword Function
highlight link javaScriptLabel Label
highlight link javaScriptLineOverflow ErrorMsg
highlight link javaScriptLogicSymbols Boolean
highlight link javaScriptNumber Number
highlight link javaScriptOpSymbols Operator
highlight link javaScriptParens Operator
