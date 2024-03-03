return {
  "chrishrb/gx.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },

  keys = {
    { "gx", mode = { "n", "x" }, "<cmd>Browse<CR>", desc = "goto browser" },
  },

  opts = {},
}
