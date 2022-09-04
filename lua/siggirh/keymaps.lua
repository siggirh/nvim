local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

local function nmap(shortcut, command)
  map('n', shortcut, command)
end

local function imap(shortcut, command)
  map('i', shortcut, command)
end

nmap('<leader>fp', '<cmd>Telescope find_files<cr>')
nmap('<leader>ff', '<cmd>Telescope live_grep<cr>')
nmap('<leader>fb', '<cmd>Telescope buffers<cr>')
nmap('<leader>fh', '<cmd>Telescope help_tags<cr>')

imap('jk', '<Esc>')
nmap('<leader>s', '<cmd>wincmd w<cr>')
nmap('<leader>q', '<cmd>wincmd q<cr>')
nmap('<leader>h', '<cmd>wincmd h<cr>')
nmap('<leader>j', '<cmd>wincmd j<cr>')
nmap('<leader>k', '<cmd>wincmd k<cr>')
nmap('<leader>l', '<cmd>wincmd l<cr>')
nmap('<leader>w', '<cmd>wincmd v<cr> <cmd>wincmd l<cr>')
nmap('<leader>W', '<cmd>wincmd s<cr> <cmd>wincmd j<cr>')

nmap('<C-e>', '<cmd>NvimTreeToggle<cr>')
nmap('<leader>ef', '<cmd>NvimTreeFindFile<cr>')
nmap('<leader>er', '<cmd>NvimTreeRefresh<cr>')

nmap('<leader>rn', '<cmd>Lspsaga rename<cr>')
nmap('<leader>ds', '<cmd>Lspsaga show_line_diagnostics<cr>')
nmap('<leader>dn', '<cmd>Lspsaga diagnostic_jump_next<cr>')
nmap('<leader>dp', '<cmd>Lspsaga diagnostic_jump_prev<cr>')
nmap('gs', '<cmd>Lspsaga signature_help<cr>')
nmap('gh', '<cmd>Lspsaga lsp_finder<cr>')
