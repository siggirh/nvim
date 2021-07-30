if !exists('g:loaded_lspsaga')
  finish
endif

lua << EOF
require('lspsaga').init_lsp_saga {
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round",
}
EOF

nnoremap <silent> <C-j> <Cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent>K <Cmd>Lspsaga hover_doc<CR>
inoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>
nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>

nnoremap <leader>rn <cmd>Lspsaga rename<CR>

nnoremap <leader>pd <cmd>Lspsaga preview_definition<CR>
