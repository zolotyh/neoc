local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

map('n', '<F5>', ':exec &nu==&rnu? "se nu!" : "se rnu!"<CR>', default_opts)
map('n', '<leader>[', '<C-O>', default_opts) -- backward navigation
map('n', '<leader>]', '<C-I>', default_opts) -- forward naviagtion navigation
