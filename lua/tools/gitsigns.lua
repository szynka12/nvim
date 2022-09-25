-- Git integration
require('gitsigns').setup {
  signs = {
    add    = { text = '+' },
    change = { text = 'c' },
    delete = { text = '-' },
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, { expr = true, desc = 'next hunk' })

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, { expr = true, desc = 'prev hunk' })

    -- Actions
    map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<cr>', { desc = 'stage hunk' })
    map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<cr>', { desc = 'reset hunk' })
    map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'undo stage hunk' })
    map('n', '<leader>hp', gs.preview_hunk, {desc = 'preview hunk'})

    map('n', '<leader>hS', gs.stage_buffer, { desc = 'stage buffer' })
    map('n', '<leader>hR', gs.reset_buffer, { desc = 'reset buffer' })

    map('n', '<leader>hd', gs.diffthis, { desc = 'diff this' })
    map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = 'diff this ~' })
    map('n', '<leader>hT', gs.toggle_deleted, { desc = 'toggle showing deleted lines' })

    -- map('n', '<leader>hb', function() gs.blame_line{full=true} end, {desc='blame line'})
    -- map('n', '<leader>tb', gs.toggle_current_line_blame)

    -- Text object
    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}

-- Chenge highlight colour on the deleted lines
vim.api.nvim_set_hl(0, 'DiffDelete', { fg= '#d7ffaf', bg = '#6f2000' })
