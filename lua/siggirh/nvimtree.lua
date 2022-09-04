local nvim_tree = require('nvim-tree')

nvim_tree.setup({
  renderer = {
    highlight_opened_files = "none",
    indent_markers = {
      enable = true,
    },
    icons = {
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = true,
      }
    },
  },
  view = {
    width = 45,
    hide_root_folder = false,
    side = "left",
  },
  git = {
    enable = false
  },
  diagnostics = {
    enable = false
  },
  filters = {
    dotfiles = false,
    custom = {
      "node_modules",
      "venv",
      ".DS_Store",
      ".idea",
      ".vscode",
      ".mypy_cache",
      "__pycache__",
      ".pytest_cache",
      ".git$"
    },
  },
  update_focused_file = {
    enable = true
  }
})
