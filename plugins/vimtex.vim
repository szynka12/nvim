" vimtex ---------------------------------------------------------------------
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
autocmd BufRead,BufNewFile *.tex,*.sty setlocal conceallevel=1
let g:tex_conceal='abdmg'
