return {
  "folke/flash.nvim",

  event = "VeryLazy",

  keys = {
    -- stylua: ignore start
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  },

  opts = {
    highlight = { backdrop = false },

    jump = {
      jumplist = true,
      history = true,
      register = true,
    },

    modes = {
      char = {
        autohide = true,
        highlight = { backdrop = false },
      },
    },
  },
}
