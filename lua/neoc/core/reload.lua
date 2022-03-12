-- Reload all user config lua modules
local module_name = '^neoc';

return function()
  for name, _ in pairs(package.loaded) do
    if name:match(module_name) then
      print(name);
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
  vim.api.nvim_command(':PackerSync')
end

