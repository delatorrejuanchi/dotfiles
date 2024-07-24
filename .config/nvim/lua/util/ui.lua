---@class util.ui.config
---@field stay_centered boolean
local config = {
  stay_centered = false,
}

---@class util.ui
local M = {}

function M.toggle_stay_centered()
  config.stay_centered = not config.stay_centered
end

---@return boolean
function M.should_stay_centered()
  return config.stay_centered
end

return M
