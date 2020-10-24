GuiTabline 0

let s:fontsize = 11

"GuiFont! Liga Source Code Pro:h11
execute "GuiFont! FiraCode Nerd Font:h" . s:fontsize

function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  execute "GuiFont! FiraCode Nerd Font:h" . s:fontsize
endfunction

noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a
