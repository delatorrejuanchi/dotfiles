---@class util.root
local M = {}

---@return string|nil
function M.get()
  return vim.loop.cwd()
end

---@return string|nil
function M.git()
  local out = vim.system({ "git", "rev-parse", "--show-toplevel" }, { cwd = M.get() }):wait()

  return out.code == 0 and out.stdout or nil
end

---@return string|nil
function M.yadm()
  if vim.fn.getcwd():find(vim.fn.expand("~") .. "/.config", 1, true) or #vim.fn.systemlist("yadm ls-files " .. M.get()) ~= 0 then
    return vim.fn.expand("~") .. "/.local/share/yadm/repo.git"
  end

  return nil
end

return M
