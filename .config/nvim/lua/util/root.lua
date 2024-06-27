---@class util.root
local M = {}

---@return string|nil
function M.get()
  return vim.loop.cwd()
end

---@return string|nil
function M.git()
  local out = vim.system({ "git", "rev-parse", "--show-toplevel" }, { cwd = M.get() }):wait()

  return out.code == 0 and vim.trim(out.stdout) or nil
end

return M
