-- main settings file

require('config.settings')
require('config.plugins')

require('tools.treesitter')
require('tools.comments')
require('tools.telescope')
require('tools.git_integration')
require('tools.lsp')
require('tools.snippets')

require('lang.tex')

require('gui.statusline')
require('gui.tabline')
require('gui.blankline')
require('gui.file_manager')
require("gui.which_key")



-- Todo
-- move the which_key from gui it doesn not belong there
-- move latex related keybinds onto the normal leader
-- cpp
-- openfoam
-- markdown
-- julia
