local wk = require("which-key")

local files = {
  f = {
    name = "file",
    f = { "<cmd>Telescope find_files<cr>",                 "find file" },
    r = { "<cmd>Telescope oldfiles<cr>",                   "open recent file" },
    n = { "<cmd>enew<cr>",                                 "new file" },
    g = { '<cmd>Telescope live_grep<cr>',                  'grep files'},
    s = { '<cmd>Telescope current_buffer_fuzzy_find<cr>',  'search cur. buf.'},
    t = { '<cmd>NvimTreeToggle<cr>',                       'tgl. file browser'},
  }
}

local code = {
  q = {
    name = "code",
    T = {'<cmd>Telescope diagnostics<cr>', 'search diagnostics'}
  }
}

local workspaces = {
  w = {
    name = 'workspaces'
  }
}

local plugins = {
  P = {
    name = "plugins",
    i = {'<cmd>PackerInstall<cr>', 'install'},
    u = {'<cmd>PackerUpdate<cr>', 'update'},
  }
}

local buffers = {
  b = {
    name = 'buffer',
    n = {'<cmd>BufferLineCycleNext<cr>', "next"},
    p = {'<cmd>BufferLineCyclePrev<cr>', "prev"},
    d = {'<cmd>Bdelete<cr>', 'delete'},
    P = {'<cmd>BufferLinePick<cr>', 'pick'}
  }
}

local windows = {
  w = {
    name = 'window',
    ['|']= {'<cmd>:vsplit', 'split vertically'},
    ['-']= {'<cmd>:split', 'split horizontally'},

  }
}

wk.register({["<leader><space>"] = { "<cmd>Telescope buffers<cr>", "browse buffers" }})
vim.keymap.set('i', '<space><tab>', '<esc>', { desc = "normal mode" })

wk.register(files, { prefix = "<leader>" })
wk.register(code, { prefix = "<leader>" })
wk.register(workspaces, { prefix = "<leader>" })
wk.register(plugins, { prefix = "<leader>" })
wk.register(buffers, { prefix = "<leader>" })
wk.register(windows, { prefix = "<leader>" })
