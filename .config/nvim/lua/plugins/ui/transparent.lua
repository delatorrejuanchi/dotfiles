return {
  {
    "xiyaowong/nvim-transparent",
    lazy = false,

    config = function()
      local transparent = require("transparent")

      transparent.clear_prefix("NeoTree")
      transparent.clear_prefix("WhichKey")

      transparent.setup({
        extra_groups = {
          "TelescopeNormal",
          "TelescopeBorder",
        },
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    optional = true,

    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
      },
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      views = {
        mini = {
          win_options = {
            winblend = 0,
          },
        },
      },
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
