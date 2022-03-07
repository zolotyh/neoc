vim.g.nvim_tree_indent_markers = true
vim.g.nvim_tree_highlight_opened_files = true
vim.g.nvim_tree_git_hl = true
vim.g.nvim_tree_special_files = { 'README.md', 'Makefile', 'MAKEFILE', 'package.json' }

vim.api.nvim_set_keymap('n', '<BS>', ':NvimTreeToggle<CR>', { noremap = true, silent = true})

local tree_cb = require'nvim-tree.config'.nvim_tree_callback


require'nvim-tree'.setup {
	hijack_cursor = true,
	actions = {
		open_file = {
			quit_on_open = true
		}
	},
	view = {
		width = 100,
		height = 100,
		side = 'right',
		auto_resize = false,
		mappings = {
			-- custom only false will merge the list with the default mappings
			-- if true, it will only use your list to set the mappings
			custom_only = false,
			-- list of mappings to set on the tree manually
			list = {
				{key = "<BS>", cb = tree_cb("close")} -- tree_cb and the cb property are deprecated
			}
		},
	}
}


