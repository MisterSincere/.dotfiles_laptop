" execute current python file
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python' shellescape(@%, 1)<CR>

" ugly specific ninjac++ build cmd
autocmd FileType cpp map <buffer> <F9> :w<CR>:exec '! cd build; ninja tracey_ex3_2 -j 4; cd -'<CR>

" jump to last position after reopening
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

