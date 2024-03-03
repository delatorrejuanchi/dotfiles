return {
  "zbirenbaum/copilot.lua",
  build = ":Copilot auth",

  cmd = "Copilot",
  event = "BufEnter",

  opts = {
    panel = { enabled = false },

    suggestion = {
      enabled = true,
      auto_trigger = true,
    },

    filetypes = {
      ["*"] = true,
    },
  },
}
