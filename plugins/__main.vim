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
  
  call dein#add('preservim/nerdtree')
  
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
 
  call dein#add('dracula/vim', {'name': 'dracula'})
  
  call dein#add('lervag/vimtex')

  call dein#add('neoclide/coc.nvim', { 'merged': 0, 'rev': 'release' })
  
  call dein#add('preservim/nerdcommenter') 
  call dein#add('honza/vim-snippets') 
  
  call dein#add('liuchengxu/vim-which-key')

  call dein#add('mhinz/vim-startify')
  
  " Git integration plugins
  call dein#add('mhinz/vim-signify')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-rhubarb')
  call dein#add('junegunn/gv.vim')

  " Terminal 
  call dein#add('voldikss/vim-floaterm')

  " Icons (keep last)
  call dein#add('ryanoasis/vim-devicons')
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
