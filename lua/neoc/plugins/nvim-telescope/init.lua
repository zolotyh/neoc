local actions = require('telescope.actions')
local map = vim.api.nvim_set_keymap


map('n', '<Leader>p', ':Telescop find_files<CR>', {noremap = true, silent = false})

require('telescope').setup {}
