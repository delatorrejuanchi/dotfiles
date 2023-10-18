return {
  {
    "nvim-treesitter/nvim-treesitter",

    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "haskell" })
    end,
  },
  {
    "mrcjkb/haskell-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    version = "^2",
    ft = { "haskell", "lhaskell", "cabal", "cabalproject" },

    config = function()
      vim.g.haskell_tools = {
        hls = {
          settings = {
            haskell = {
              plugin = {
                stan = { globalOn = false },
              },
            },
          },
        },
      }
    end,
  },
}
