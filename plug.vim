call plug#begin('~/.vim/plugged')

" Theme
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" Git
Plug 'tpope/vim-fugitive'

" Telescope and necessary plugins for it
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'ray-x/lsp_signature.nvim'
Plug 'hrsh7th/nvim-compe'

" Plug 'glepnir/lspsaga.nvim'
" Temporary, since finder preview is broken in glepnir/lspsaga
Plug 'jasonrhansen/lspsaga.nvim', {'branch': 'finder-preview-fixes'}

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" File tree
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" Status line
Plug 'hoob3rt/lualine.nvim'

" Formattings
Plug 'sbdchd/neoformat'

call plug#end()
