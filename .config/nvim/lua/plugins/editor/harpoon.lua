local prefix = "<leader>h"

return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },

    event = "VeryLazy",

    opts = {},

    keys = {
      {
        prefix .. "a",
        function()
          local harpoon = require("harpoon")
          harpoon:list():append()
        end,
        desc = "Tag",
      },
      {
        prefix .. "h",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list(), { border = "rounded", title_pos = "center" })
        end,
        desc = "Toggle quick menu",
      },
      {
        prefix .. "j",
        function()
          local harpoon = require("harpoon")
          harpoon:list():select(1)
        end,
        desc = "select(1)",
      },
      {
        prefix .. "k",
        function()
          local harpoon = require("harpoon")
          harpoon:list():select(2)
        end,
        desc = "select(2)",
      },
      {
        prefix .. "l",
        function()
          local harpoon = require("harpoon")
          harpoon:list():select(3)
        end,
        desc = "select(3)",
      },
    },
  },
  {
    "folke/which-key.nvim",
    optional = true,

    opts = {
      defaults = {
        [prefix] = { name = "+harpoon" },
      },
    },
  },
}
