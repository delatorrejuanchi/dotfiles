return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "BufEnter",
  build = ":Copilot auth",

  ---@type copilot_config
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
    },
    panel = { enabled = false },
    filetypes = {
      yaml = true,
      markdown = true,
      help = true,
      gitcommit = true,
    },
  },
}
