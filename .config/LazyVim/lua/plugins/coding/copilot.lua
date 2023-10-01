if os.time() >= os.time({ year = 2023, month = 10, day = 27 }) then
  return {}
end

return {
  {
    "zbirenbaum/copilot.lua",
    build = ":Copilot auth",

    cmd = "Copilot",
    event = "InsertEnter",

    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
      },
      filetypes = {
        markdown = true,
      },
    },
  },
}
