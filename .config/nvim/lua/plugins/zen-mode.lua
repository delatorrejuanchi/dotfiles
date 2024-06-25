return {
  "folke/zen-mode.nvim",

  keys = {
    {
      "<leader>zz",
      function()
        require("zen-mode").toggle()
      end,
      desc = "toggle zen mode",
    },
  },

  opts = {
    window = {
      width = 140,
    },
  },
}
