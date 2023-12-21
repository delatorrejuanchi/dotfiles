local wezterm = require("wezterm")

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Tokyo Night Storm"
config.font = wezterm.font("SFMono Nerd Font")
config.font_size = 12

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.95
config.macos_window_background_blur = 2
config.hide_tab_bar_if_only_one_tab = true

config.disable_default_key_bindings = false
config.adjust_window_size_when_changing_font_size = false
config.allow_win32_input_mode = false
config.window_close_confirmation = "NeverPrompt"

-- smart-splits
-- performance issues: https://github.com/mrjones2014/smart-splits.nvim/issues/134
config.keys = require("smart-splits").keys

return config
