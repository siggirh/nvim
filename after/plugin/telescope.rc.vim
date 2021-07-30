nnoremap <leader>fq <cmd>Telescope current_buffer_fuzzy_find<CR>
nnoremap <leader>ff <cmd>Telescope live_grep<CR>
nnoremap <leader>fp <cmd>Telescope find_files<CR>

lua << EOF
local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      }
    }
  }
}
EOF

