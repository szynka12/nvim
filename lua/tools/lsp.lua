require('mason').setup()
require('mason-lspconfig').setup()

vim.diagnostic.config({
  virtual_text = true,
  signs = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = 'rounded' }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = 'rounded' }
)

-- Configurations for various lsp
local lspconfig = require('lspconfig')

lspconfig.sumneko_lua.setup({
  on_attach = function(client, bufnr)
    require("config.keymap").basic_lsp(client, bufnr)
  end,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

-- Tex lsp
lspconfig.texlab.setup {
  on_attach = function(client, bufnr)
    require("config.keymap").tex_lsp(client, bufnr)
  end,
}

-- OpenFoam lsp
-- TODO: This does not work now (kind of)!
-- lspconfig.foam_ls.setup {
--   on_attach = function(client, bufnr)
--     require("config.keymap").basic_lsp(client, bufnr)
--   end,
-- }

lspconfig.ccls.setup {
  on_attach = function(client, bufnr)
    require("config.keymap").basic_lsp(client, bufnr)
  end,
}
