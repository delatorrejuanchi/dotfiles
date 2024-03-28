---@class util
---@field lsp util.lsp
---@field git util.git
---@field plugin util.plugin
---@field root util.root
local M = {
  lsp = require("util.lsp"),
  git = require("util.git"),
  root = require("util.root"),
  plugin = require("util.plugin"),
}

---@param ms number
---@param fn fun(...)
function M.debounce(ms, fn)
  local timer = vim.uv.new_timer()

  if timer == nil then
    return fn
  end

  return function(...)
    local argv = { ... }

    timer:start(ms, 0, function()
      timer:stop()

      vim.schedule_wrap(fn)(unpack(argv))
    end)
  end
end

return M
