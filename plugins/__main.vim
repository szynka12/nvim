" Edited for dein plugins
if &compatible
  set nocompatible
endif

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  " **************************************************************************
  
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  
  " Theme related things -------------------------------------------------------
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('dracula/vim', {'name': 'dracula'})
  call dein#add('mhinz/vim-startify')
  call dein#add('liuchengxu/vim-which-key')
  call dein#add('preservim/nerdcommenter', { 'on_map': '<leader>c' }) 
  call dein#add('ryanoasis/vim-devicons')
  
  call dein#add('preservim/nerdtree', {'on_cmd': 'NERDTreeToggle'})
  
  call dein#add('neoclide/coc.nvim', { 'merged': 0, 'rev': 'release' })
  
  " Latex 
  call dein#add('lervag/vimtex',
        \ {'on_ft': ['tex', 'sty', 'cls', 'bib']})
  
  "C++ lang
  call dein#add('octol/vim-cpp-enhanced-highlight', {'on_ft': ['c', 'cpp']})
  call dein#add('rhysd/vim-clang-format',           {'on_ft': ['c', 'cpp']})
  
  call dein#add('honza/vim-snippets') 
  
  " Git integration plugins ----------------------------------------------------
  " Line markers
  call dein#add('mhinz/vim-signify')
  " Basic git functionality
  call dein#add('tpope/vim-fugitive', 
        \ { 
        \   'on_cmd': [ 'Git', 'Gstatus', 'Gwrite', 'Glog', 'Gcommit', 
        \       'Gblame', 'Ggrep', 'Gdiff', ] 
        \ } )
 
  " Git github connectivity, dont need that now
  "call dein#add('tpope/vim-rhubarb')
  
  " Commit browser 
  call dein#add('junegunn/gv.vim', 
        \ {
        \     'on_cmd'  : ['GV', 'GV!', 'GV?'],
        \     'depends' : ['vim-fugitive']
        \ })


  " **************************************************************************
  call dein#end()
  call dein#save_state()
endif

" Required
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" Remove unused plugins
call map(dein#check_clean(), "delete(v:val, 'rf')")
call dein#recache_runtimepath()

" ****************************************************************************
" ****************************************************************************

" Source plugin specific configs
source $HOME/.config/nvim/plugins/coc.vim

source $HOME/.config/nvim/plugins/vimtex.vim
"source $HOME/.config/nvim/plugins/tex-conceal.vim

source $HOME/.config/nvim/plugins/nerdtree.vim
source $HOME/.config/nvim/plugins/airline.vim
source $HOME/.config/nvim/plugins/startify.vim

source $HOME/.config/nvim/plugins/vim-floatterm.vim

source $HOME/.config/nvim/plugins/signify.vim

" ******************************************************************************
" Keep this at the end as it maps keybindings to the rest of the plugins 
source $HOME/.config/nvim/plugins/vim-which-key.vim
