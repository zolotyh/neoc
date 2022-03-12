-- Map keys
-- https://leafo.net/guides/function-cloning-in-lua.html
-- @param fn function
-- @return string
local map_fn = function(key)
  local opts = {noremap = true}
  vim.api.nvim_set_keymap(key[1], key[2], key[3], opts)
end

return map_fn
