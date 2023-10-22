return {
  'nvim-lualine/lualine.nvim',
  lazy = false,
  config = function()
    local theme = require('lualine.themes.nightfox')
    theme.normal.c.bg = nil

    require('lualine').setup({
      options = {
        theme = theme,
        icons_enabled = true
      },
      sections = {
        lualine_b = { 'filename' },
        lualine_c = { 'branch', 'diff' },
        lualine_x = {},
        lualine_y = { 'diagnostics' }
      }
    })
  end
}
