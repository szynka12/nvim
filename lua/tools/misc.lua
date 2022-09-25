-- Comments plugin
require('Comment').setup {}

-- Automatically configures sumneko_lua for Neovim config, Neovim runtime
-- and plugin directories
require("lua-dev").setup {}

-- Twelescope magic, file finder, buffer changer 
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  }
}

-- Fuzzy finder
require('telescope').load_extension('fzf')


