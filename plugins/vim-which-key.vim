nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  '\'<CR>

autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'

" NerdCommenter 
let g:which_key_map.c = { 'name': '+comments',
      \ 'c'       : 'comment',
      \ '<Space>' : 'toggle' ,
      \ '-'       : [':Spacer "-"','spacer <->'],
      \ '*'       : [':Spacer "*"','spacer <*>'],
      \ }
" Sessions
":SLoad       load a session
":SSave[!]    save a session
":SDelete[!]  delete a session
":SClose      close a session

let g:which_key_map.S = {
  \ 'name' : '+Session',
  \ 'l' : [':SLoad',    'load'],
  \ 's' : [':SSave',    'save'],
  \ 'S' : [':SSave!',   'save!'],
  \ 'd' : [':SDelete',  'delete'],
  \ 'D' : [':SDelete!', 'delete!'],
  \ 'c' : [':Sclose',   'close'],
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

" Files
let g:which_key_map.f = {
      \ 'name' : '+files' ,
      \ 's': [':source $MYVIMRC',  'source vimrc'],
      \ 'c': [':sp $MYVIMRC',      'edit vimrc'],
      \ 't': [':NERDTreeToggle',  'browser'],
      \ }

" Buffers
let g:which_key_map.b = {
  \ 'name' : '+buffers',
  \ 'n': [':bn',      'next'],
  \ 'p': [':bp',      'previous'],
  \ 's': 'change by name',
  \ 'd': [':bd',      'delete'],
  \ 'D': [':bd!',         'delete!'],
  \ 'a': 'add',
  \ }

"Misc
let g:which_key_map.m = {
  \ 'name': '+misc',
  \ 'h'   : [ ':nohlsearch', 'disable highlight search'],
  \ }

"Mapping for the coc, defined in separate file 
let g:which_key_map.q = {'name': '+coc'}

" Git integration
let g:which_key_map.g = {
  \ 'name': '+git',
  \ 'j': ['<plug>(signify-next-hunk)',  'next hunk'],
  \ 'k': ['<plug>(signify-prev-hunk)',  'prev hunk'],
  \ 't': ['SignifyToggle',              'toggle signs'],
  \ 'T': ['SignifyToggleHighligh',      'toggle signs'],
  \ 's': [':Gstatus',                   'status'],
  \ 'c': [':Gcommit',                   'commit'],
  \ 'p': [':Git push',                  'push'],
  \ 'a': [':Git add .',                 'add .'],
  \ 'G': ['GBrowse',                    'github.com'],
  \ 'l': ['GV',                         'log'],
  \ 'L': ['GV',                         'log (this file)'],
  \ }

" Integrated termianal
let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ ';' : [':FloatermNew --wintype=window-below --height=6'        , 'terminal'],
      \ 't' : [':FloatermToggle'                                , 'toggle'],
      \ }


" Register which key map
call which_key#register('<Space>', "g:which_key_map")
