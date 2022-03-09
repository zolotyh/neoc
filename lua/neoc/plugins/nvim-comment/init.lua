require('nvim_comment').setup()

require('neoc.core.lib.mapfn') {'n', '<Leader>c<Space>', ':CommentToggle<CR>'}
require('neoc.core.lib.mapfn') {'v', '<Leader>c<Space>', ':CommentToggle<CR>'}
