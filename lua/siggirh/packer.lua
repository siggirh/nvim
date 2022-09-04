require('packer').startup(function()
  use('wbthomason/packer.nvim')

  use('nvim-lua/plenary.nvim')
  use('nvim-telescope/telescope.nvim')
  use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })

  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

  use('nvim-lualine/lualine.nvim')
  use('kyazdani42/nvim-web-devicons')

  use('kyazdani42/nvim-tree.lua')

  use('onsails/lspkind-nvim')

  use('neovim/nvim-lspconfig')
  use('williamboman/nvim-lsp-installer')
  use('tami5/lspsaga.nvim')

  use('windwp/nvim-autopairs')
  use('windwp/nvim-ts-autotag')

  use('rose-pine/neovim')
  use('f-person/auto-dark-mode.nvim')

  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-vsnip')
  use('hrsh7th/vim-vsnip')

  use('psf/black')
  use({ 'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production' })

  use('tpope/vim-fugitive')
end)
