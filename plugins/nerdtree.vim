" NERDTree -------------------------------------------------------------------
" Start nerd tree with the same folder as vim was started with ( nvim . ) 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * 
      \ if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") 
      \ | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | 
      \ endif
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'nerdtree') | q | endif
