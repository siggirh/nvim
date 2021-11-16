call plug#begin('~/.vim/plugged')

" Theme
Plug 'savq/melange'

" Git
Plug 'tpope/vim-fugitive'

" Telescope and necessary plugins
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'

"Use fzy native for searching in telescope
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'ray-x/lsp_signature.nvim'

" Completion with nvim lsp
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

"Snippets (for use with cmp)
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Icons in completion menu
Plug 'onsails/lspkind-nvim'

" Plug 'glepnir/lspsaga.nvim'
" Temporary, since finder preview is broken in glepnir/lspsaga
Plug 'jasonrhansen/lspsaga.nvim', {'branch': 'finder-preview-fixes'}

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'IndianBoy42/tree-sitter-just' " Just config files

" File tree
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" Status line
Plug 'hoob3rt/lualine.nvim'

" Formattings
Plug 'sbdchd/neoformat'

call plug#end()
