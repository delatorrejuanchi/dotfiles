local wezterm = require("wezterm")

local function is_nvim(pane)
	local user_vars = pane.user_vars or pane:get_user_vars()

	return user_vars.IS_NVIM == "true" -- NOTE: IS_NVIM is managed by the mrjones2014/smart-splits.nvim plugin
end

local function forward_or_default(key, mods, default_callback)
	return {
		key = key,
		mods = mods,
		action = wezterm.action_callback(function(win, pane)
			if is_nvim(pane) then
				win:perform_action({ SendKey = { key = key, mods = mods } }, pane)
			else
				default_callback(win, pane)
			end
		end),
	}
end

return {
	is_nvim = is_nvim,
	forward_or_default = forward_or_default,
}
