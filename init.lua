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
require('tools.which_key')



-- Todo
-- cpp
-- openfoam
-- markdown
-- julia
-- make the basic config work on the cluster as well
-- one line install
