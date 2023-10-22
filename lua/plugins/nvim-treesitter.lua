
local config = function()
  local ts_configs = require('nvim-treesitter.configs')
  ts_configs.setup({
    indent = {
      enable = true,
    },
    autotag = {
      enable = true,
    },
    ensure_installed = {
      'markdown',
      'json',
      'javascript',
      'typescript',
      'yaml',
      'html',
      'css',
      'markdown',
      'bash',
      'lua',
      'dockerfile',
      'gitignore',
      'python',
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
    },
  })
end

return {
  'nvim-treesitter/nvim-treesitter',
  config = config,
  lazy = false,
}
