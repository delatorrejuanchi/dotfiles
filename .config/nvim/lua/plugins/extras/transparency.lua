if true then
  return {}
end

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
