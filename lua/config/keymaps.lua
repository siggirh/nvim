local opts = { noremap = true, silent = true }

-- Navigate splits
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Windows
vim.keymap.set('n', '<leader>w', ':vsplit<CR>', opts)
vim.keymap.set('n', '<leader>W', ':split<CR>', opts)

-- Indent repeat
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

vim.keymap.set('n', '<leader>s', ':w<CR>', opts)
