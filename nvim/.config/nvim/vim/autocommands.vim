" execute current python file
autocmd FileType c setlocal foldmethod=syntax

" jump to last position after reopening
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

