local wezterm = require("wezterm")
local neovim = require("neovim")
local util = require("util")
local workspace = require("workspace")

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Tokyo Night Storm"

config.font = wezterm.font({
	family = "MonaspiceNe NFM",
	harfbuzz_features = { "ss01", "calt" },
})

config.font_size = 24

-- performance issues: https://github.com/wez/wezterm/issues/2669
config.window_decorations = "RESIZE|MACOS_FORCE_DISABLE_SHADOW"
-- wayland issues: https://github.com/wez/wezterm/issues/5103
config.enable_wayland = false

config.max_fps = 120
config.enable_tab_bar = false
config.inactive_pane_hsb = {}

-- config.disable_default_key_bindings = true
config.adjust_window_size_when_changing_font_size = false
config.allow_win32_input_mode = false
config.window_close_confirmation = "NeverPrompt"

config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

config.leader = { key = " ", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
	neovim.forward_or_default("LeftArrow", "CTRL", util.focus_relative_fn("Left")),
	neovim.forward_or_default("DownArrow", "CTRL", util.focus_relative_fn("Down")),
	neovim.forward_or_default("UpArrow", "CTRL", util.focus_relative_fn("Up")),
	neovim.forward_or_default("RightArrow", "CTRL", util.focus_relative_fn("Right")),

	{ key = "|", mods = "LEADER", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "-", mods = "LEADER", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "f", mods = "LEADER", action = wezterm.action.TogglePaneZoomState },

	{ key = "s", mods = "LEADER", action = workspace.open_switcher("Switch to workspace:") },
	{ key = "v", mods = "LEADER", action = workspace.open_switcher("Switch to workspace in Neovim:", { "nvim" }) },
	{ key = "q", mods = "LEADER", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
}

return config
