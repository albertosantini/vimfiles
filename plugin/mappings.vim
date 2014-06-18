" Util mappings
nnoremap <f4> :cw<cr>:cn<cr>
nnoremap <S-f4> :cw<cr>:cp<cr>
nnoremap <f6> :bn<cr>
nnoremap <S-f6> :bp<cr>
nnoremap <Leader>l :ls<cr>
nnoremap <Leader>t :browse oldfiles<cr>
nnoremap <Leader>w :bd<cr>
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
function! CommentToggle()
    let l:comment_char = escape(substitute(&commentstring, "%s", " ", ""),"\/")
    execute ':silent! s/\([^ ]\)/' . comment_char . '\1/'
    execute ':silent! s/^\( *\)' . comment_char . ' \?' . comment_char . ' \?/\1/'
endfunction

noremap <silent> <Leader>c :call CommentToggle()<CR>

" Display the syntax name under the cursor
nnoremap <C-S-P> :echo synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")<CR>
