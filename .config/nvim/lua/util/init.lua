---@class Util
---@field root Root
local M = {
  root = require("util.root"),
  plugin = require("util.plugin"),
}

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
