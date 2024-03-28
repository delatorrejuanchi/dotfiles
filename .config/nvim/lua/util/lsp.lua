---@class util.lsp
local M = {}

---@param fn fun(client, buffer)
function M.on_attach(fn)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
      local client = vim.lsp.get_client_by_id(event.data.client_id)
      if not client then
        return
      end

      fn(client, event.buf)
    end,
  })
end

return M
