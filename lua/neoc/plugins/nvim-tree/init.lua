vim.api.nvim_set_keymap('n', '<BS>', ':NvimTreeFindFileToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>o', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

local tree_cb = require'nvim-tree.config'.nvim_tree_callback

require'nvim-tree'.setup {
  renderer = {
    highlight_git = true,
    highlight_opened_files = 'all',
    special_files = {'README.md', 'Makefile', 'MAKEFILE', 'package.json'},
    indent_width = 2,
    indent_markers = {
      enable = true
    }
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 400,
  },
  view = {
    width = 50,
    side = 'left',
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

