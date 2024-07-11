return {
  {
    "xiyaowong/nvim-transparent",

    event = "VeryLazy",

    opts = {},

    config = function(_, opts)
      local transparent = require("transparent")

      transparent.setup(opts)

      transparent.clear_prefix("NormalFloat")
    end,
  },
  {
    "folke/tokyonight.nvim",
    optional = true,

    opts = {
      transparent = true,

      on_highlights = function(highlights)
        highlights.StatusLine = { bg = "none" }
        highlights.StatusLineNC = { bg = "none" }
      end,

      styles = {
        sidebars = "transparent",
      },
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
    "folke/trouble.nvim",
    optional = true,

    dependencies = {
      {
        "xiyaowong/nvim-transparent",

        opts = function()
          require("transparent").clear_prefix("Trouble")
        end,
      },
    },
  },
}
