if !exists('g:lspconfig')
  finish
endif
  
nnoremap <leader>rn :Lspsaga rename<CR>
nnoremap <leader>ds :Lspsaga show_line_diagnostics<CR>
nnoremap <leader>dn :Lspsaga diagnostic_jump_next<CR>
nnoremap <leader>dp :Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent>gs :Lspsaga signature_help<CR>
nnoremap <silent>gh :Lspsaga lsp_finder<CR>

lua << EOF
local nvim_lsp = require('lspconfig')
local protocol = require('vim.lsp.protocol')
local lsp_signature = require('lsp_signature')
local saga = require('lspsaga')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap = true, silent = true }

  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "single"})

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = false,
      signs = false,
      update_in_insert = false,
    }
  )

  protocol.CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    '', -- Field
    '', -- Variable
    '', -- Class
    'ﰮ', -- Interface
    '', -- Module
    '', -- Property
    '', -- Unit
    '', -- Value
    '', -- Enum
    '', -- Keyword
    '﬌', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    '', -- Struct
    '', -- Event
    'ﬦ', -- Operator
    '', -- TypeParameter
  }
end

lsp_signature.setup({
  hint_enable = false
})

saga.init_lsp_saga {
  border_style = 'round',
  use_saga_diagnostic_sign = false,
  code_action_prompt = {
    enable = false,
  }
}

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "typescript.tsx" }
}

nvim_lsp.pyright.setup { 
  on_attach = on_attach,
  settings = {
    python = {
      pythonPath = "venv/bin/python"
    }
  }
}
EOF
