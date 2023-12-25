local wezterm = require("wezterm")
local neovim = require("neovim")
local util = require("util")

local workspace = require("workspace")

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Tokyo Night Storm"
config.font = wezterm.font("SFMono Nerd Font")
config.font_size = 12

config.window_decorations = "RESIZE|MACOS_FORCE_DISABLE_SHADOW" -- performance issues: https://github.com/wez/wezterm/issues/2669
-- config.window_background_opacity = 0.95
-- config.macos_window_background_blur = 2
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.inactive_pane_hsb = {}

-- config.disable_default_key_bindings = true
config.adjust_window_size_when_changing_font_size = false
config.allow_win32_input_mode = false
config.window_close_confirmation = "NeverPrompt"

config.keys = {
	neovim.forward_or_default("h", "CTRL", util.focus_relative_fn("Left")),
	neovim.forward_or_default("j", "CTRL", util.focus_relative_fn("Down")),
	neovim.forward_or_default("k", "CTRL", util.focus_relative_fn("Up")),
	neovim.forward_or_default("l", "CTRL", util.focus_relative_fn("Right")),

	neovim.forward_or_default("h", "CTRL|META", util.resize_relative_fn("Left")),
	neovim.forward_or_default("j", "CTRL|META", util.resize_relative_fn("Down")),
	neovim.forward_or_default("k", "CTRL|META", util.resize_relative_fn("Up")),
	neovim.forward_or_default("l", "CTRL|META", util.resize_relative_fn("Right")),

	{ key = "s", mods = "CTRL", action = workspace.build_switcher("Switch to workspace:") },
	{ key = "v", mods = "CTRL", action = workspace.build_switcher("Switch to workspace in Neovim:", { "nvim" }) },
}

return config
