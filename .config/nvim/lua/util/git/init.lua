---@class util.git
---@field blame util.git.blame
local M = {
  blame = require("util.git.blame"),
}

function M:lazygit()
  util.terminal.open("lazygit", { size = { width = 1, height = 1 } })
end

function M:root()
  local result = vim.system({ "git", "rev-parse", "--show-toplevel" }):wait()

  return result.code == 0 and vim.trim(result.stdout) or nil
end

return M
