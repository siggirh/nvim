if !exists('g:loaded_nvim_treesitter')
  finish
endif

lua << EOF
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {}
  },
  ensure_installed = {
    "tsx",
    "json",
    "jsonc",
    "yaml",
    "html",
    "scss"
  }
}
EOF
