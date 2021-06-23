" vimtex ---------------------------------------------------------------------
let g:tex_flavor='latex'

if has("win32")
    "let g:vimtex_view_method='mupdf'
    let g:vimtex_view_general_viewer = 'SumatraPDF' 
    let g:vimtex_view_general_options='-reuse-instance -forward-search @tex @line @pdf'
    let g:vimtex_view_general_options_latexmk='-reuse-instance'
else
    let g:vimtex_view_method='zathura'
endif

autocmd BufRead,BufNewFile *.tex,*.sty setlocal conceallevel=1
autocmd BufRead,BufNewFile *.tex,*.sty setlocal textwidth=100
autocmd BufRead,BufNewFile *.tex,*.sty setlocal nowrap

let g:tex_conceal="abdgms"

