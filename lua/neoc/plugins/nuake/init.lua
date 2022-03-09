local g = vim.g

g.nuake_position = 'top'
g.nuake_size = 0.5

require('neoc.core.lib.mapfn') {'n', '<C-a>', ':Nuake<CR>'}
require('neoc.core.lib.mapfn') {'t', '<C-a>', '<C-\\><C-n>:Nuake<CR>'}
require('neoc.core.lib.mapfn') {'i', '<C-a>', '<C-\\><C-n>:Nuake<CR>'}
