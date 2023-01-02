require'hop'.setup()

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "s", "<cmd>lua require'hop'.hint_words()<cr>")
map("n", "r", "<cmd>lua require'hop'.hint_lines()<cr>")
map("v", "s", "<cmd>lua require'hop'.hint_words()<cr>")
map("v", "r", "<cmd>lua require'hop'.hint_lines()<cr>")

map('o','<silent> m', ':<C-U>lua require("tsht").nodes()<cr>')
map('x','<silent> m', ':lua require("tsht").nodes()<cr>')
