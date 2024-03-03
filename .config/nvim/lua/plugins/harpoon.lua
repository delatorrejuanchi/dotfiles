local prefix = "<leader>h"

return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",

    dependencies = {
      { "nvim-lua/plenary.nvim" },
      {
        "folke/which-key.nvim",
        optional = true,

        opts = {
          defaults = {
            [prefix] = { name = "+harpoon" },
          },
        },
      },
    },

    opts = {},

    keys = {
      -- stylua: ignore
      { prefix .. "a", function() require("harpoon"):list():append() end, desc = "add" },
      {
        prefix .. "h",
        function()
          local harpoon = require("harpoon")

          harpoon.ui:toggle_quick_menu(harpoon:list(), { border = "rounded", title_pos = "center" })
        end,
        desc = "toggle quick menu",
      },
    },
  },
}
