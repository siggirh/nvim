vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  
  -- Fancy icons
  use 'kyazdani42/nvim-web-devicons'

  -- Git
  use 'tpope/vim-fugitive'

  -- Telescope and native fzf sorting
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    }
  }

  -- Treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- Status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    }
  }

  -- Nvim Tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
  }

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'tami5/lspsaga.nvim'
  use 'ray-x/lsp_signature.nvim'

  -- Theme
  use 'navarasu/onedark.nvim'

  -- Completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  -- Pictograms for nvim lsp
  use 'onsails/lspkind-nvim'

  -- Formatting
  use {
    'prettier/vim-prettier',
    run = 'yarn install --frozen-lockfile --production'
  }
  use 'psf/black'

end)

require('barely_usable')
