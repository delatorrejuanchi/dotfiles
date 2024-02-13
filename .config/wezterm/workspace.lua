local wezterm = require("wezterm")

---@type string
local zoxide_path = "zoxide"

---@param workspace string
---@return string
---@param index number
local function get_workspace_label(workspace, index)
	return wezterm.format({ { Text = "󱂬  " .. workspace .. " (" .. index .. ")" } })
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
---@param spawn_args string[]?
local function open_switcher(title, spawn_args)
	return wezterm.action_callback(function(win, pane)
		local choices = {}

		local workspaces = wezterm.mux.get_workspace_names()
		for i, workspace in ipairs(workspaces) do
			table.insert(choices, {
				id = "workspace_" .. workspace,
				label = get_workspace_label(workspace, #workspaces - i + 1),
			})
		end

		local zoxide_dirs = get_zoxide_dirs()
		for _, dir in ipairs(zoxide_dirs) do
			table.insert(choices, {
				id = dir,
				label = string.gsub(dir, wezterm.home_dir, "~"),
			})
		end

		win:perform_action(
			wezterm.action.InputSelector({
				title = title,
				choices = choices,
				fuzzy = true,
				action = wezterm.action_callback(function(_, _, id, label)
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

					run_child_process({ zoxide_path, "add", id })
				end),
			}),
			pane
		)
	end)
end

---@param index number
local function switch_by_index(index)
	return wezterm.action_callback(function(win, pane)
		local workspaces = wezterm.mux.get_workspace_names()
		local workspace = workspaces[#workspaces - index + 1]
		if not workspace then
			return
		end

		win:perform_action(wezterm.action.SwitchToWorkspace({ name = workspace }), pane)
	end)
end

return {
	open_switcher = open_switcher,
	switch_by_index = switch_by_index,
}
