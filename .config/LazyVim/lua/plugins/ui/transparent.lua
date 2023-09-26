return {
  {
    "xiyaowong/nvim-transparent",
    lazy = false,

    config = function()
      local transparent = require("transparent")

      transparent.clear_prefix("lualine")
      transparent.clear_prefix("NeoTree")

      transparent.setup({
        extra_groups = {
          "NormalFloat",
        },
      })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    optional = true,

    ---@class CatppuccinOptions
    opts = {
      transparent_background = true,
    },
  },
  {
    "rcarriga/nvim-notify",
    optional = true,

    opts = {
      background_colour = "#000000",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    optional = true,

    opts = function(_, opts)
      local transparent_auto = require("lualine.themes.auto")
      transparent_auto.normal.c.bg = "none"
      transparent_auto.inactive.c.bg = "none"

      opts.options.theme = transparent_auto
    end,
  },
}
