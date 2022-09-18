require('mason').setup()
require('mason-lspconfig').setup()

local lspconfig = require('lspconfig')

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)


local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- helper function to insert description into options 
  local ins_desc = function (description)
    return {
      desc = description,
      noremap=true, silent=true, buffer=bufnr
    }
  end

  -- keymaps for lsp 
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, ins_desc 'got to decl.' )
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition,  ins_desc 'go to def.')
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, ins_desc 'go to impl.')
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, ins_desc 'go to references')

  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, ins_desc 'fun. signature')
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, ins_desc 'hover' )

  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, ins_desc 'add wrkspce fldr')
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, ins_desc 'rmv wrkspce fldr')
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, ins_desc 'lst wrkspce fldr')

  vim.keymap.set('n', '<space>qd', vim.lsp.buf.type_definition, ins_desc 'go to type def.')
  vim.keymap.set('n', '<space>qr', vim.lsp.buf.rename, ins_desc 'rename under cursor')
  vim.keymap.set('n', '<space>qc', vim.lsp.buf.code_action, ins_desc 'code action' )
  vim.keymap.set('n', '<space>qf', vim.lsp.buf.formatting, ins_desc('format'))
end

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
  {border = 'rounded'}
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  {border = 'rounded'}
)

lspconfig.sumneko_lua.setup({
  on_attach = on_attach,
  flags = lsp_flags,
  settings = {
    Lua = {
      diagnostics = {
        globals = {"vim"},
      },
    },
  },
})


