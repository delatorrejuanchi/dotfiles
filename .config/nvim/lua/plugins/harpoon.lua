return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",

  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "folke/which-key.nvim",
      optional = true,

      opts = {
        defaults = {
          ["<leader>h"] = { name = "+harpoon" },
        },
      },
    },
  },

  keys = {
    {
      "<leader>ha",
      function()
        require("harpoon"):list():append()
      end,
      desc = "add",
    },
    {
      "<leader>hh",
      function()
        local harpoon = require("harpoon")

        harpoon.ui:toggle_quick_menu(harpoon:list(), { border = "rounded", title_pos = "center" })
      end,
      desc = "toggle quick menu",
    },
  },

  opts = {},
}
