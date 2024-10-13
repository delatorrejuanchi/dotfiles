---@class util
---@field lsp util.lsp
---@field git util.git
---@field plugin util.plugin
---@field terminal util.terminal
---@field notes util.notes
---@field ui util.ui
---@field health util.health
local M = {
  lsp = require("util.lsp"),
  git = require("util.git"),
  plugin = require("util.plugin"),
  terminal = require("util.terminal"),
  notes = require("util.notes"),
  ui = require("util.ui"),
  health = require("util.health"),
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

--- @param text string
function M.copy_to_clipboard(text)
  vim.fn.setreg("+", text)
end

---@param search string
function M.quick_grep(search)
  vim.cmd("silent grep! " .. search .. " --glob='!.git/'")
  vim.cmd("copen")
  vim.cmd("cfirst")
end

return M
