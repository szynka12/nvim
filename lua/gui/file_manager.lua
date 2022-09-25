require('nvim-tree').setup({
  hijack_cursor = false,
  on_attach = require("config.keymap").nvim_tree
})


