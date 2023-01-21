vim.cmd [[set exrc]]
vim.cmd [[set nu]]
vim.cmd [[set relativenumber]]
vim.cmd [[set nohlsearch]]
vim.cmd [[set hidden]]
vim.cmd [[set noerrorbells]]
vim.cmd [[set tabstop=2]]
vim.cmd [[set softtabstop=2]]
vim.cmd [[set shiftwidth=2]]
vim.cmd [[set expandtab]]
vim.cmd [[set smartindent]]
vim.cmd [[set nowrap]]
vim.cmd [[set noswapfile]]
vim.cmd [[set nobackup]]
vim.cmd [[set undodir=~/.vim/undodir]]
vim.cmd [[set undofile]]
vim.cmd [[set incsearch]]
vim.cmd [[set termguicolors]]
vim.cmd [[set scrolloff=8]]
vim.cmd [[set noshowmode]]
vim.cmd [[set completeopt=menu,menuone,noselect]]
vim.cmd [[set signcolumn=number]]
--vim.cmd [[set cmdheight=2]]
vim.cmd [[set updatetime=50]]
vim.cmd [[set lazyredraw]]
vim.cmd [[set cursorline]]

vim.opt.updatetime = 50
vim.opt.mouse = 'a'
vim.g.mapleader = ' '

-- Disable netrw for nvimtree
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- Prettier
vim.cmd [[let g:prettier#exec_cmd_async = 1]]
vim.cmd [[let g:prettier#autoformat = 1]]
vim.cmd [[let g:prettier#autoformat_require_pragma = 0]]

-- Black
vim.cmd [[autocmd BufWritePre *.py execute ':Black']]
