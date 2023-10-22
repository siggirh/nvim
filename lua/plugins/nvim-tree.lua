return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	opts = {
		filters = {
			dotfiles = false,
			custom = {
				"node_modules",
				".venv",
				".DS_Store",
				".idea",
				".vscode",
				".mypy_cache",
				"__pycache__",
				".pytest_cache",
				".git$",
			},
		},
		renderer = {
			indent_width = 1,
		},
	},
	keys = {
		vim.keymap.set("n", "<leader>tf", ":NvimTreeFocus<CR>", opts),
		vim.keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>", opts),
	},
}
