local auto_dark_mode = require('auto-dark-mode')

local override_highlights = function()
  vim.cmd [[ highlight! link NormalFloat Normal ]]
  vim.cmd [[ highlight! MatchParen cterm=bold gui=bold guifg=#fab387 guibg=NONE ]]
end


auto_dark_mode.setup({
  update_interval = 1000,
  set_dark_mode = function()
    vim.api.nvim_set_option('background', 'dark')
    vim.cmd [[ colorscheme catppuccin-macchiato ]]
    override_highlights()
  end,
  set_light_mode = function()
    vim.api.nvim_set_option('background', 'light')
    vim.cmd [[ colorscheme catppuccin-latte ]]
    override_highlights()
  end,
})

auto_dark_mode.init()
