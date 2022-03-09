require('nvim_comment').setup()

require('neoc.core.lib.mapfn') {'n', '<Leader>c<Space>', ':CommentToggle<CR>'}
