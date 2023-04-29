local opt = vim.opt
local g = vim.g
local cmd = vim.cmd
local local_options = vim.bo

-----------------------------------------------------------
-- General
-----------------------------------------------------------
g.mapleader = ' ' -- Change leader to a space
g.termguicolors = true -- Set true GUI colors for Console
cmd('filetype plugin indent on') -- auto indent

opt.autoindent = true
opt.cmdheight = 2
opt.expandtab = true
opt.shiftwidth = 2
opt.showtabline = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.wrap = false -- Disable wrap
opt.mouse = 'a' -- Enable mouse support
opt.swapfile = false -- Don't use swapfile
opt.gdefault = true -- Use global substitute
opt.vb = true -- Use global substitute

opt.undodir = os.getenv("HOME") .. '/.vim/undodir'
opt.undofile = true
opt.relativenumber = true
opt.number = true
opt.foldlevelstart=100
opt.foldnestmax=2
colorscheme='desert'

-----------------------------------------------------------
-- Fold
-----------------------------------------------------------
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
opt.foldcolumn = '1'


-----------------------------------------------------------
-- Local options
-----------------------------------------------------------
local_options.autoindent = true
local_options.expandtab = true
local_options.shiftwidth = 2
local_options.tabstop = 2
local_options.makeprg='eslint_d --format unix --ext .ts,.tsx src/'
local_options.errorformat='%f:%l:%c: %m,%-G%.%#'

vim.cmd [[
  augroup myfiletypes
    autocmd BufNewFile,BufRead *.njk set filetype=html
  augroup END
]]
