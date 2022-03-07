local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

map('n', '<F5>', ':exec &nu==&rnu? "se nu!" : "se rnu!"<CR>', default_opts)
