local treesitter = require('nvim-treesitter.configs')

treesitter.setup({
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = false
  },
  indent = {
    enable = true,
  },
  ensure_installed = {
    "css",
    "dockerfile",
    "go",
    "html",
    "javascript",
    "json",
    "json5",
    "jsonc",
    "lua",
    "prisma",
    "python",
    "scss",
    "tsx",
    "typescript",
    "vim",
    "yaml",
  }
})
