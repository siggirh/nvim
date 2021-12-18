local nvim_tree = require('nvim-tree')

vim.g.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 1,
  folder_arrows = 1
}

vim.g.nvim_tree_highlight_opened_files = 3
vim.g.nvim_tree_indent_markers = 1

nvim_tree.setup({
  view = {
    width = 40,
    hide_root_folder = true,
  },
  git = {
    enable = false
  },
  diagnostics = {
    enable = false
  },
  filters = {
    dotfiles = true,
    custom = { "node_modules", ".DS_Store", ".idea", ".vscode", ".mypy_cache", ".git"}
  },
  update_focused_file = {
    enable = true
  }
})

