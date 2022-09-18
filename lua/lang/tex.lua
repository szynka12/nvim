vim.g.vimtex_mappings_enabled = true
vim.g.vimtex_view_method='zathura'
vim.g.tex_conceal="abdgms"
vim.cmd('autocmd BufRead,BufNewFile *.tex,*.sty setlocal conceallevel=1')
vim.cmd('autocmd BufRead,BufNewFile *.tex,*.sty hi clear Conceal')


