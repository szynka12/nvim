
let s:fontsize = 11

if has("win32")
  let s:fontname = "FiraCode NF"
else
  let s:fontname = "FiraCode Nerd Font"
endif


function! SetFont()
  execute "GuiFont! ".s:fontname.":h".s:fontsize
endfunction

function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  :call SetFont()
endfunction

noremap <C-=> :call AdjustFontSize(1)<CR>
noremap <C-_> :call AdjustFontSize(-1)<CR>
inoremap <C-=> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C--> <Esc>:call AdjustFontSize(-1)<CR>a

" Actuall settings

:call SetFont()

" Disable GUI Tabline
if exists(':GuiTabline')
    GuiTabline 0
endif

" Disable GUI Popupmenu
if exists(':GuiPopupmenu')
    GuiPopupmenu 0
endif

" Enable GUI ScrollBar
if exists(':GuiScrollBar')
    GuiScrollBar 1
endif

" Enable Mouse
set mouse=a

" Right Click Context Menu (Copy-Cut-Paste)
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
vnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
