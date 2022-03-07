local map = vim.api.nvim_set_keymap

map('n', '<Leader>p', ':Telescope find_files<CR>', {noremap = true, silent = false})
map('n', '<Leader>s', ':Telescope live_grep<CR>', {noremap = true, silent = false})

require('telescope').setup {}
