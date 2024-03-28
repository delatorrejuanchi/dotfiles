---@class util.plugin
local M = {}

---@param name string
---@param fn fun()
function M.on_load(name, fn)
  local config = require("lazy.core.config")

  if not config.spec.plugins[name] or not config.spec.plugins[name].enabled then
    return
  end

  if config.plugins[name] and config.plugins[name]._.loaded then
    fn()
  else
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyLoad",
      callback = function(event)
        if event.data == name then
          fn()
          return true
        end
      end,
    })
  end
end

return M
