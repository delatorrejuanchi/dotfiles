---@class util.terminal
local M = {}

---@param cmd? string[]|string
---@param opts? LazyCmdOptions
function M.open(cmd, opts)
  require("lazy.util").float_term(cmd, opts)
end

return M
