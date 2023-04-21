vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require('lazy').setup({
  {
    'tjdevries/colorbuddy.nvim',
    config = function()
      require('colorbuddy').setup()
    end
  },
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'tpope/vim-sleuth',
  'f-person/auto-dark-mode.nvim',
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    config = function()
      require("onedarkpro").setup({
        styles = {
          types = "NONE",
          methods = "NONE",
          numbers = "NONE",
          strings = "NONE",
          comments = "NONE",
          keywords = "bold",
          constants = "NONE",
          functions = "NONE",
          operators = "NONE",
          variables = "NONE",
          parameters = "NONE",
          conditionals = "NONE",
          virtual_text = "NONE",
        }
      })
    end
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'folke/neodev.nvim',
    },
  },

  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip'
    },
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      show_trailing_blankline_indent = false,
    },
  },

  {
    'folke/which-key.nvim',
    opts = {},
  },

  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup({
        options = {
          icons_enabled = true,
          theme = 'onedark',
        },
        sections = {
          lualine_b = { 'filename' },
          lualine_c = { 'branch', 'diff' },
          lualine_x = {},
          lualine_y = { 'diagnostics' },
        },
      })
    end
  },

  {
    'kyazdani42/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    }
  },

  {
    'numToStr/Comment.nvim',
    opts = {},
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },

  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
  },

  'psf/black',

  {
    'prettier/vim-prettier',
    run = 'yarn install --frozen-lockfile --production',
  }
})

--require('siggirh/auto-dark-mode')
require('siggirh/settings')
require('siggirh/keymaps')
require('siggirh/cmp')
require('siggirh/lsp')
require('siggirh/telescope')
require('siggirh/treesitter')
require('siggirh/nvimtree')
require('siggirh/telescope')
