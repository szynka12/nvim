" General commands ***********************************************************

" Switch windows in normal mode ----------------------------------------------
noremap <Tab> <C-w>W

" Open vimrc in a split ------------------------------------------------------
nnoremap <silent> <leader>ev :sp $MYVIMRC<cr>
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>

" Toggle NERDTree ------------------------------------------------------------
noremap <silent> <leader>ft :NERDTreeToggle<CR>

" Managing buffers -----------------------------------------------------------
noremap <silent> <leader>bn :bn<CR>
noremap <silent> <leader>bp :bp<CR>
noremap <leader>bt :b<Space> 
noremap <silent> <leader>bd :bd<CR>
noremap <silent> <leader>bD :bd!<CR>
noremap <leader>bN :badd<space>

" Spacers --------------------------------------------------------------------
noremap <silent> <leader>iS :call FillLine('*')<CR>
noremap <silent> <leader>is :call FillLine('-')<CR>

" Misc -----------------------------------------------------------------------
noremap <silent> <leader>hd :nohlsearch<CR>
" You can't stop me
cmap w!! w !sudo tee %

