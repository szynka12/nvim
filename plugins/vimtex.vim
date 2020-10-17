" vimtex ---------------------------------------------------------------------
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
autocmd BufRead,BufNewFile *.tex,*.sty setlocal conceallevel=1
autocmd BufRead,BufNewFile *.tex,*.sty setlocal textwidth=100
autocmd BufRead,BufNewFile *.tex,*.sty setlocal nowrap
let g:tex_conceal="abdgms"

