return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- colors, themes & gui
  use 'crusoexia/vim-monokai' --monokai theme
  use 'kyazdani42/nvim-web-devicons' --icons
  use 'nvim-lualine/lualine.nvim' --status line
  use { 'akinsho/bufferline.nvim', --tabline
    tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'
  }
  use 'lukas-reineke/indent-blankline.nvim' --indent lines
  use 'kyazdani42/nvim-tree.lua'

  use { "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end
  }

  -- file editing & general coding
  use 'nvim-treesitter/nvim-treesitter'
  use 'wellle/targets.vim' --new targets for operations
  use 'numToStr/Comment.nvim' --commenting text
  use 'tpope/vim-surround'
  use { 'nvim-telescope/telescope.nvim', --fuzzy finder
    tag = '0.1.0', requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build'
        .. '--config Release && cmake --install build --prefix build' }
  use 'tpope/vim-repeat' --add repeat actions to plugins
  use 'moll/vim-bbye' --close the buffer without the change of the layout

  -- snippets
  use({ "L3MON4D3/LuaSnip", tag = "v1.*" }) --snippets engine
  use "rafamadriz/friendly-snippets" --snippets collection

  -- autocompletion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- git integration
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'

  -- lsp
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  -- lua
  use 'tjdevries/nlua.nvim'
  use 'saadparwaiz1/cmp_luasnip'

  --latex 
  use 'lervag/vimtex'


  if install_plugins then
    require('packer').sync()
  end

end)
