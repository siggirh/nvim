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
vim.cmd [[set updatetime=50]]
vim.cmd [[set lazyredraw]]
vim.cmd [[set cursorline]]

vim.o.updatetime = 50
vim.o.mouse = 'a'

-- Disable netrw for nvimtree
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd [[ colorscheme onedark ]]

-- Prettier
vim.cmd [[let g:prettier#exec_cmd_async = 1]]
vim.cmd [[let g:prettier#autoformat = 1]]
vim.cmd [[let g:prettier#autoformat_require_pragma = 0]]

-- Black
vim.cmd [[autocmd BufWritePre *.py execute ':Black']]


-- Fix floating background to be transparent
--vim.cmd [[ highlight! link NormalFloat Normal ]]
-- Remove backgroundf from matching parens in floating window
--vim.cmd [[ highlight! MatchParen cterm=bold gui=bold guifg=#fab387 guibg=NONE ]]
