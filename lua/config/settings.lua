-- main nvim settings
local g = vim.g -- Global variables
local opt = vim.opt -- Set options (global/buffer/windows-scoped)

-- Numbering
opt.number = true
opt.relativenumber = true


-- Code indenting
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 22
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Searching in text files
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = false

-- Misc
opt.mouse = 'nv'
opt.clipboard = 'unnamedplus'

-- Completion
opt.completeopt = { 'menu', 'menuone', 'noselect' } -- Autocomplete options

-- Graphics
opt.termguicolors = true
opt.showmode = false
vim.cmd('colorscheme monokai')

-- Keybinds
vim.g.mapleader = ' '
-- vim.keymap.set('n', '<leader>w', '<cmd>write<cr>') --save

-- Commands
vim.api.nvim_create_user_command('ReloadConfig', 'source $MYVIMRC', {})

-- Which key
opt.timeoutlen = 500

-- Bootstrap packer (does not work currently)
-- require('packer_bootstrap')
