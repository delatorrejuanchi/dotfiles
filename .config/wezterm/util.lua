local function resize_relative_fn(direction, amount)
	amount = amount or 3

	return function(win, pane)
		win:perform_action({ AdjustPaneSize = { direction, amount } }, pane)
	end
end

local function focus_relative_fn(direction)
	return function(win, pane)
		win:perform_action({ ActivatePaneDirection = direction }, pane)
	end
end

return {
	resize_relative_fn = resize_relative_fn,
	focus_relative_fn = focus_relative_fn,
}
