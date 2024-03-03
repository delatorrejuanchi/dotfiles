local util = require("util")

return {
  {
    "xiyaowong/nvim-transparent",

    event = "VeryLazy",

    opts = {},
  },
  {
    "folke/tokyonight.nvim",
    optional = true,

    opts = {
      transparent = true,

      -- FIXME: doing this we can no longer configure on_highlights elsewhere.
      on_highlights = function(highlights)
        highlights.StatusLine = { bg = "none" }
        highlights.StatusLineNC = { bg = "none" }
      end,
    },
  },
  {
    "folke/noice.nvim",
    optional = true,

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
  {
    "folke/which-key.nvim",
    optional = true,

    init = function()
      util.on_load("which-key.nvim", function()
        require("transparent").clear_prefix("WhichKey")
      end)
    end,
  },
}
