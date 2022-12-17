local status, lualine = pcall(require, 'lualine')

if (not status) then return end

lualine.setup({
  sections = {
    lualine_b = { 'filename' },
    lualine_c = { 'branch', 'diff' },
    lualine_x = {},
    lualine_y = { 'diagnostics' },
  }
})
