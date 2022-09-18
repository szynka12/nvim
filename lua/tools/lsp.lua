require('mason').setup()
require('mason-lspconfig').setup()

local lspconfig = require('lspconfig')

local ins_desc = function(description)
  return {
    desc = description,
    noremap = true, silent = true
  }
end

vim.keymap.set('n', '<space>qe', vim.diagnostic.open_float, ins_desc 'diag. float')
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, ins_desc 'next diag.')
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, ins_desc 'prev_diag')
vim.keymap.set('n', '<space>qq', vim.diagnostic.setloclist, ins_desc 'diagnostics')


local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- helper function to insert description into options
  local ins_desc = function(description)
    return {
      desc = description,
      noremap = true, silent = true, buffer = bufnr
    }
  end

  -- keymaps for lsp
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, ins_desc 'got to decl.')
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, ins_desc 'go to def.')
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, ins_desc 'go to impl.')
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, ins_desc 'go to references')

  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, ins_desc 'fun. signature')
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, ins_desc 'hover')

  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, ins_desc 'add wrkspce fldr')
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, ins_desc 'rmv wrkspce fldr')
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, ins_desc 'lst wrkspce fldr')

  vim.keymap.set('n', '<space>qd', vim.lsp.buf.type_definition, ins_desc 'go to type def.')
  vim.keymap.set('n', '<space>qr', vim.lsp.buf.rename, ins_desc 'rename under cursor')
  vim.keymap.set('n', '<space>qc', vim.lsp.buf.code_action, ins_desc 'code action')
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
  { border = 'rounded' }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = 'rounded' }
)

lspconfig.sumneko_lua.setup({
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

local on_attach_tex = function(client, bufnr)
  on_attach(client, bufnr)
  
  -- helper function to insert description into options
  local ins_desc = function(description)
    return {
      desc = description,
      noremap = true, silent = true, buffer = bufnr
    }
  end

  vim.keymap.set('n', 'li', '<plug>(vimtex-info)', ins_desc 'info')
  vim.keymap.set('n', 'lt', '<plug>(vimtex-toc-toggle)', ins_desc 'toggle toc')
  vim.keymap.set('n', 'lq', '<plug>(vimtex-log)', ins_desc 'log')
  vim.keymap.set('n', 'll', '<plug>(vimtex-compile)', ins_desc 'compile')
  vim.keymap.set('n', 'lc', '<plug>(vimtex-clean)', ins_desc 'clean')
  vim.keymap.set('n', 'lH', '<plug>(vimtex-stop)', ins_desc 'stop')
  vim.keymap.set('n', 'le', '<plug>(vimtex-errors)', ins_desc 'errors')
  vim.keymap.set('n', 'lm', '<plug>(vimtex-env-toggle-math)', ins_desc '[math] toggle env')
  vim.keymap.set('n', 'ls', '<plug>(vimtex-cmd-toggle-star)', ins_desc '[cmd] toggle star')
  vim.keymap.set('n', 'lS', '<plug>(vimtex-env-toggle-star)', ins_desc '[env] toggle star')
  vim.keymap.set('n', 'lM', '<plug>(vimtex-delim-add-modifiers)', ins_desc '[math] add \\left')
  vim.keymap.set('n', 'lD', '<plug>(vimtex-delim-toggle-modifier)', ins_desc '[math] toggle \\left')
  vim.keymap.set('n', 'le', '<plug>(vimtex-env-change)', ins_desc '[env] change')
end


lspconfig.texlab.setup({
  on_attach = on_attach_tex,
})

-- TODO: This does not work now (kind of)!
lspconfig.foam_ls.setup({
  on_attach = on_attach,
})
