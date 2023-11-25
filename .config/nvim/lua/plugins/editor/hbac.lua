return {
  "axkirillov/hbac.nvim",

  event = "VeryLazy",

  keys = {
    { "<leader>bp", "<cmd>Hbac toggle_pin<cr>", desc = "Toggle pin" },
  },

  opts = {
    threshold = 10,
  },
}
