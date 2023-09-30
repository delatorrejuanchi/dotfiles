if os.time() >= os.time({ year = 2023, month = 10, day = 27 }) then
  return {}
end

return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    lazy = false,
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 50,
      },
    },
  },
}
