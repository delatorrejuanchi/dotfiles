---@class util.git
local M = {}

function M.lazygit()
  util.terminal.open("lazygit", { size = { width = 1, height = 1 } })
end

return M
