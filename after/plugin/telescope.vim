nnoremap <leader>fq <cmd>Telescope current_buffer_fuzzy_find<CR>
nnoremap <leader>ff <cmd>Telescope live_grep<CR>
nnoremap <leader>fp <cmd>Telescope find_files<CR>

lua << EOF
local actions = require('telescope.actions')
local telescope = require('telescope')

telescope.setup {
  defaults = {
    file_sorter = require('telescope.sorters').get_fzf_sorter,
    prompt_prefix = ' > ',
    color_devicons = true,

    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

    mappings = {
      n = {
        ["C-x"] = false,
        ["C-q"] = actions.send_to_qflist,
        ["q"] = actions.close
      }
    }
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true
    },
  }
}

telescope.load_extension('fzy_native')

EOF

