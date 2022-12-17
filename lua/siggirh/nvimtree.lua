local nvim_tree = require('nvim-tree')

nvim_tree.setup({
  renderer = {
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
    }
  },
  view = {
    adaptive_size = true,
  },
  git = {
    enable = false,
  },
  diagnostics = {
    enable = false,
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
    enable = true,
  }
})
