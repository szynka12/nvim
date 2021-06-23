" Set leader key
let g:mapleader = "\<Space>"

if has('win32')
	source $HOME/AppData/Local/nvim/plugins/__main.vim
	source $HOME/AppData/Local/nvim/general/settings.vim
	source $HOME/AppData/Local/nvim/general/functions.vim
	source $HOME/AppData/Local/nvim/general/commands.vim
	source $HOME/AppData/Local/nvim/general/keymap.vim
else
	source $HOME/.config/nvim/plugins/__main.vim
	source $HOME/.config/nvim/general/settings.vim
	source $HOME/.config/nvim/general/functions.vim
	source $HOME/.config/nvim/general/commands.vim
	source $HOME/.config/nvim/general/keymap.vim
endif


