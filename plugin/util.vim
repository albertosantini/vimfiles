" Display the syntax name under the cursor
nmap <C-S-P> :echo synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")<CR>


" Comment and uncomment
noremap <silent> <Leader>cc :<C-B>silent <C-E>s/^/<C-R>=escape(substitute(&commentstring, '%s', ' ', ''),'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> <Leader>cu :<C-B>silent <C-E>s/^\V<C-R>=escape(substitute(&commentstring, '%s', ' ', ''),'\/')<CR>//e<CR>:nohlsearch<CR>

