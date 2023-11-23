return {
  "axkirillov/hbac.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },

  event = "VeryLazy",

  opts = {
    threshold = 10,
  },
}
