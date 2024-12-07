return {
  {
    "mrcjkb/haskell-tools.nvim",

    ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
  },
  {
    "neovim/nvim-lspconfig",
    optional = true,

    opts = {
      setup = {
        hls = function()
          return true
        end,
      },
    },
  },
}
