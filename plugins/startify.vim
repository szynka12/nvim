"SLoad       load a session
":SSave[!]    save a session
":SDelete[!]  delete a session
":SClose      close a session

let g:startify_session_dir = '~/.cache/nvim_sessions/'

let g:startify_lists = [
  \ { 'type': 'files',     'header': ['   Files']            },
  \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
  \ { 'type': 'sessions',  'header': ['   Sessions']       },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ ]

let g:startify_session_autoload = 1

let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:startify_enable_special = 0

let g:startify_custom_header = [
      \'        _    _      _ _                              _         _ ',
      \'       |*|  |*|    | |*|                            |*|       |*| ',
      \'       |*|__|*| ___| |*| ___     ___ _____   _ _ __ |*| ____ _|*| ',
      \'       |* __ *|/ _ \ |*|/ _ \   / __|_  / | | | |_ \|*|/ / _` |*| ',
      \'       |*|  |*|  __/ |*| (_) |  \__ \/ /| |_| | | | |*  < (_| |_| ',
      \'       |_|  |_|\___|_|_|\___( ) |___/___|\__, |_| |_|_|\_\__,_(_) ',
      \'                            |/            __/ |                  ',
      \'                                         |___/                   '
      \]
