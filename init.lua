-- main settings file

require('config.settings')
require('config.plugins')

require('tools.misc')
require('tools.treesitter')
require('tools.gitsigns')
require('tools.lsp')
require('tools.snippets')

require('lang.tex')

require('gui.statusline')
require('gui.tabline')
require('gui.blankline')
require('gui.file_manager')

require("config.keymap").shared()

require('tools.which_key')




-- TODO
-- [x] clean upt the tools folder 
-- [ ] realod the lua config without quiting vim
-- [x] make packer clone itself
-- [x] move keybinds to an additional file
-- [ ] cpp
-- [ ] openfoam
-- [ ] markdown
-- [ ] julia
-- [ ] make the basic config work on the cluster as well
