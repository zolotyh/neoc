local map = vim.api.nvim_set_keymap

map('n', '<Leader>p',  ':Telescope find_files hidden=true<CR>', {noremap = true, silent = false})
map('n', '<Leader>ip', ':Telescope find_files find_command=fd,--no-ignore, --hidden<CR>', {noremap = true, silent = false})
map('n', '<Leader>is', ':Telescope live_grep find_command=rg,--ignore,--hidden<CR>', {noremap = true, silent = false})
map('n', '<Leader>s',  ':Telescope live_grep<CR>', {noremap = true, silent = false})
map('n', '<Leader>t',  ':Telescope treesitter<CR>', {noremap = true, silent = false})
map('n', '<Leader>aa',  ':Telescope aerial<CR>', {noremap = true, silent = false})

require('telescope').setup {}
require('telescope').load_extension('aerial')
