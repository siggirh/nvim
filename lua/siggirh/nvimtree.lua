local nvim_tree = require('nvim-tree')

nvim_tree.setup({
  renderer = {
    highlight_opened_files = "all",
    indent_markers = {
      enable = true,
    },
    icons = {
      show = {
        git = false,
        folder = true,
        file = true,
        folder_arrow = true
      }
    },
  },
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
    dotfiles = false,
    custom = { "node_modules", ".DS_Store", ".idea", ".vscode", ".mypy_cache", ".git", "__pycache__", ".pytest_cache"}
  },
  update_focused_file = {
    enable = true
  }
})

