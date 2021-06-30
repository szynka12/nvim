autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  '/'<CR>

" Define prefix dictionary
let g:which_key_map =  {}

" Plugin management
let g:which_key_map.P = {
    \ 'name' : '+Plugin' ,
    \ 'i' : ['PlugInstall' , 'install'],
    \ 'c' : ['PlugClean'   , 'clean'],
    \ 'u' : ['PlugUpdate'  , 'update'],
    \ }

" Tabline management
let g:which_key_map.b = {
    \ 'name' : '+buffer' ,
    \ 'n' : ['BufferNext',          'next'],
    \ 'p' : ['BufferPrevious',      'prev'],
    \ 'N' : ['BufferMoveNext',      'move next'],
    \ 'P' : ['BufferMovePrevious',  'move prev'],
    \ 'l' : ['BufferLast',          'last'],
    \ 'd' : ['BufferClose',         'close'],
    \ 'm' : ['BufferPick',          'pick'],
    \ }

" File tree
let g:which_key_map.f = {
    \ 'name' : '+file' ,
    \ 's' : ['wq',              'save'],
    \ 't' : ['NvimTreeToggle',  'browse'],
    \ }


let g:which_key_map.S = {
  \ 'name' : '+Session',
  \ 'l' : [':SLoad',    'load'],
  \ 's' : [':SSave',    'save'],
  \ 'S' : [':SSave!',   'save!'],
  \ 'd' : [':SDelete',  'delete'],
  \ 'D' : [':SDelete!', 'delete!'],
  \ 'c' : [':Sclose',   'close'],
  \ }


"Mapping for the coc, defined in separate file 
let g:which_key_map.q = {
       \'name': '+coc',
       \ 'F': ['ClangFormat', 'format c++'],
       \ }

" Windows
let g:which_key_map['w'] = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'J' : [':resize +5'  , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : [':resize -5'  , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
      \ }

nnoremap <silent> <leader>/  :Commentary<CR>
" let g:which_key_map.'/' = {'name' : 'comment'}

