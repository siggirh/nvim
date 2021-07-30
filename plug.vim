call plug#begin('~/.vim/plugged')

" Theme
Plug 'gruvbox-community/gruvbox'

"Git
Plug 'tpope/vim-fugitive'

" Bracket matcher
Plug 'cohama/lexima.vim'

" Telescope and necessary plugins for it
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'glepnir/lspsaga.nvim'

" Completion
Plug 'hrsh7th/nvim-compe'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" File tree
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

"Status line
Plug 'hoob3rt/lualine.nvim'

" Formattings
Plug 'sbdchd/neoformat'

call plug#end()
