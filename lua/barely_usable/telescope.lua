local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup({
  defaults = {
    layout_strategy = 'vertical',
    file_sorter = require('telescope.sorters').get_fzf_sorter,
    prompt_prefix = '  ',
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
    fuzzy = true,
    override_generic_sorter = true,
    override_file_sorter = true,
    case_mode = "smart_case"
  }
})

telescope.load_extension('fzf')

