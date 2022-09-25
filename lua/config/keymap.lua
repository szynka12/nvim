local keymap = {}

local ins_desc = function(description)
  return {
    desc = description,
    noremap = true, silent = true
  }
end

-- Shared keymaps among all buffers
function keymap.shared()
  -- basic lsp keymaps
  vim.keymap.set('n', '<space>qe', vim.diagnostic.open_float, ins_desc 'diag. float')
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, ins_desc 'next diag.')
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, ins_desc 'prev_diag')
  vim.keymap.set('n', '<space>qq', vim.diagnostic.setloclist, ins_desc 'diagnostics')

  -- unbind the shift plus arrows combinations
  vim.keymap.set('n', '<s-down>', '<nop>' , { noremap = true, silent = true })
  vim.keymap.set('n', '<s-up>', '<nop>' , { noremap = true, silent = true })
  vim.keymap.set('v', '<s-down>', '<nop>' , { noremap = true, silent = true })
  vim.keymap.set('v', '<s-up>', '<nop>' , { noremap = true, silent = true })

  vim.keymap.set('i', 'jj', '<esc>', { desc = "normal mode" })
end



function keymap.basic_lsp(client, bufnr)

  -- helper function to insert description into options
  local ins_desc = function(description)
    return {
      desc = description,
      noremap = true, silent = true, buffer = bufnr
    }
  end
  
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

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

function keymap.tex_lsp(client, bufnr)
  keymap.basic_lsp(client, bufnr)

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

function keymap.cmp_mapping(cmp, luasnip, select_opts)
  return {
    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
    ['<Down>'] = cmp.mapping.select_next_item(select_opts),

    ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
    ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),

    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({select = true}),

    ['<C-d>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, {'i', 's'}),

    ['<C-b>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {'i', 's'}),

    ['<Tab>'] = cmp.mapping(function(fallback)
      local col = vim.fn.col('.') - 1

      if cmp.visible() then
        cmp.select_next_item(select_opts)
      elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        fallback()
      else
        cmp.complete()
      end
    end, {'i', 's'}),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(select_opts)
      else
        fallback()
      end
    end, {'i', 's'}),
  }
end

function keymap.nvim_tree(bufnr)
    local api = require('nvim-tree.api')
    
    local bufmap = function(lhs, rhs, desc)
      vim.keymap.set('n', lhs, rhs, {buffer = bufnr, desc = desc})
    end

    bufmap('L', api.node.open.edit, 'Expand folder or go to file')
    bufmap('H', api.node.navigate.parent_close, 'Close parent folder')
    bufmap('gh', api.tree.toggle_hidden_filter, 'Toggle hidden files')
end


return keymap
