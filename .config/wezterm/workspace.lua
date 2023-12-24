local wezterm = require("wezterm")

---@type string
local zoxide_path = "zoxide"

---@param workspace string
---@return string
local function get_workspace_label(workspace)
	return wezterm.format({ { Text = "󱂬: " .. workspace } })
end

---@param args string[]
---@return string?
local function run_child_process(args)
	local success, stdout, stderr = wezterm.run_child_process({ os.getenv("SHELL"), "-c", table.concat(args, " ") })

	if not success then
		wezterm.log_error(stderr)
		return nil
	end

	return stdout
end

---@return string[]
local function get_zoxide_dirs()
	return wezterm.split_by_newlines(run_child_process({ zoxide_path, "query", "-l" }) or "")
end

---@param title string
---@param choices { id: string, label: string }[]
---@param spawn_args string[]?
local function build_switcher_input_selector(title, choices, spawn_args)
	return wezterm.action.InputSelector({
		title = title,
		choices = choices,
		fuzzy = true,
		action = wezterm.action_callback(function(win, pane, id, label)
			if not id or not label then
				return
			end

			local workspace = string.match(id, "^workspace_(.+)$")
			if workspace then
				win:perform_action(wezterm.action.SwitchToWorkspace({ name = workspace }), pane)
				return
			end

			win:perform_action(
				wezterm.action.SwitchToWorkspace({
					name = id,
					spawn = {
						label = label,
						cwd = id,
						args = spawn_args and { os.getenv("SHELL"), "-cli", table.concat(spawn_args, " ") },
					},
				}),
				pane
			)

			run_child_process({ "zoxide", "add", id })
		end),
	})
end

---@param title string
---@param spawn_args string[]?
local function build_switcher(title, spawn_args)
	return wezterm.action_callback(function(win, pane)
		local workspaces = wezterm.mux.get_workspace_names()
		local zoxide_dirs = get_zoxide_dirs()

		local choices = {}
		for _, workspace in ipairs(workspaces) do
			table.insert(choices, {
				id = "workspace_" .. workspace,
				label = get_workspace_label(workspace),
			})
		end

		for _, dir in ipairs(zoxide_dirs) do
			table.insert(choices, {
				id = dir,
				label = string.gsub(dir, wezterm.home_dir, "~"),
			})
		end

		win:perform_action(build_switcher_input_selector(title, choices, spawn_args), pane)
	end)
end

return {
	build_switcher = build_switcher,
}
