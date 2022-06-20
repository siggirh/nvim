local lspsaga = require('lspsaga')

lspsaga.init_lsp_saga({
  border_style = 'round',
  use_saga_diagnostic_sign = false,
  code_action_prompt = {
    enable = false,
  }
})
