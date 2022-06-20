local configs = require('nvim-treesitter.configs')

configs.setup({
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = false
  },
  indent = {
    enable = false,
  },
  --indent = {
  --  enable = true,
  --  disable = {
  --    "typescript",
  --    "typescriptreact",
  --  }
  --},
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
