return {
  "zbirenbaum/copilot.lua",
  build = ":Copilot auth",

  event = "InsertEnter",

  cmd = "Copilot",

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
