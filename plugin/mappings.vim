" Util mappings
nnoremap <f2> :ls<cr>
nnoremap <f4> :cw<cr>:cn<cr>
nnoremap <S-f4> :cw<cr>:cp<cr>
nnoremap <f6> :bn<cr>
nnoremap <S-f6> :bp<cr>
nnoremap <Leader>w :bd<cr>
nnoremap <Leader>t :browse oldfiles<cr>
nnoremap <silent> <esc> :nohlsearch<cr>
nnoremap gp `[v`]
vnoremap < <gv
vnoremap > >gv

" Swap lines
nnoremap <A-j> :m .+1<CR>
nnoremap <A-k> :m .-2<CR>
inoremap <A-j> <Esc>:m .+1<CR>gi
inoremap <A-k> <Esc>:m .-2<CR>gi
vnoremap <A-j> :m '>+1<CR>gv
vnoremap <A-k> :m '<-2<CR>gv

" Comment and uncomment
noremap <silent> <Leader>cc :<C-B>silent <C-E>s/^/<C-R>=escape(substitute(&commentstring, "%s", " ", ""),"\/")<CR>/<CR>:nohlsearch<CR>
noremap <silent> <Leader>cu :<C-B>silent <C-E>s/^\V<C-R>=escape(substitute(&commentstring, "%s", " ", ""),"\/")<CR>//e<CR>:nohlsearch<CR>

" Display the syntax name under the cursor
nnoremap <C-S-P> :echo synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")<CR>
