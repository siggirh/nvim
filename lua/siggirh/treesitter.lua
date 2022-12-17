local status, treesitter = pcall(require, 'nvim-treesitter.configs')

if (not status) then return end

treesitter.setup({
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = false
  },
  indent = {
    enable = false,
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
