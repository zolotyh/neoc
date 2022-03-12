local M = {}
local default_config = {}

function M.init()

  -- Global State to track config, events, commands, keymaps, etc
  _G.Neoc = {config = default_config, events = {}, commands = {}, keymaps = {}}

  local reload = require('neoc.core.reload')
  local command = require('neoc.core.command')
  command('Config', [[edit $MYVIMRC]])
  command('ConfigReload', reload)
end

return M;
