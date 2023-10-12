if os.time() >= os.time({ year = 2023, month = 10, day = 27 }) then
  return {}
end

return { import = "lazyvim.plugins.extras.coding.copilot" }
