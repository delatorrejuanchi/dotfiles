---@class util
local M = {}

---@param name string
---@param fn fun()
function M.on_load(name, fn)
  local config = require("lazy.core.config")

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

---@param ms number
---@param fn fun()
function M.debounce(ms, fn)
  local timer = vim.uv.new_timer()

  return function(...)
    local argv = { ... }

    timer:start(ms, 0, function()
      timer:stop()
      vim.schedule_wrap(fn)(unpack(argv))
    end)
  end
end

---@param on_attach fun(client, buffer)
function M.lsp_on_attach(on_attach)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
      local client = vim.lsp.get_client_by_id(event.data.client_id)
      if not client then
        return
      end

      on_attach(client, event.buf)
    end,
  })
end

return M
