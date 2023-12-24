return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "BufEnter",
  build = ":Copilot auth",

  ---@type copilot_config
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = vim.fn.getcwd():find("/Volumes/code/") ~= 1,
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
