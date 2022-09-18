-- main settings file

require('config.settings')
require('config.plugins')

require('tools.treesitter')
require('tools.comments')
require('tools.telescope')
require('tools.git_integration')
require('tools.lsp')
require('tools.snippets')

require('gui.statusline')
require('gui.tabline')
require('gui.blankline')
require('gui.file_manager')
require("gui.which_key")
