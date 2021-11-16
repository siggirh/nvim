set exrc
set nu
set nohlsearch
set hidden
set noerrorbells
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=number
set colorcolumn=100
set cmdheight=2
set updatetime=50
set lazyredraw
set background=dark
set mouse=a

runtime ./plug.vim

" Global
let mapleader = " "

colorscheme melange

nnoremap <leader>q :wincmd q<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>w :wincmd v<CR>:wincmd l<CR>
nnoremap <leader>W :wincmd s<CR>:wincmd j<CR>

