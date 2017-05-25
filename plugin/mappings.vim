" Util mappings

function! <SID>QuickCycle(TryCmd, CatchCmd)
    try
        execute a:TryCmd
    catch /^Vim\%((\a\+)\)\=:E553/
        execute a:CatchCmd
    endtry
endfunction

nnoremap <f4> :cw<CR>:call <SID>QuickCycle("cn", "cfirst")<CR>
nnoremap <S-f4> :cw<CR>:call <SID>QuickCycle("cp", "clast")<CR>
nnoremap <f6> :bn<CR>
nnoremap <S-f6> :bp<CR>
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>t :browse oldfiles<CR>
nnoremap <Leader>w :bd<CR>
nnoremap <silent> <esc> :nohlsearch<CR>
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

" Surround and unsurround with double quote
nnoremap <Leader>q ciw"<C-R>""<ESC>
nnoremap <Leader>Q di"hPl2

" Return to/from Explorer
nnoremap <Leader>e :Rexplore<CR>
