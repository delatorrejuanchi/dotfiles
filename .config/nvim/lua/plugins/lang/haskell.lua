return {
  {
    "mrcjkb/haskell-tools.nvim",
    dependencies = {
      { "nvim-telescope/telescope.nvim", optional = true },
    },

    ft = { "haskell", "lhaskell", "cabal", "cabalproject" },

    config = function()
      local ok, telescope = pcall(require, "telescope")
      if ok then
        telescope.load_extension("ht")
      end
    end,
  },
  {
    "neovim/nvim-lspconfig",
    optional = true,

    opts = {
      setup = {
        -- ensure that lspconfig doesn't start hls since it might conflict with haskell-tools
        hls = function()
          return true
        end,
      },
    },
  },
  {
    "luc-tielen/telescope_hoogle",
    dependencies = {
      { "nvim-telescope/telescope.nvim", optional = true },
    },

    ft = { "haskell", "lhaskell", "cabal", "cabalproject" },

    config = function()
      local ok, telescope = pcall(require, "telescope")
      if ok then
        telescope.load_extension("hoogle")
      end
    end,
  },
  {
    "nvim-neotest/neotest",
    optional = true,

    dependencies = { "mrcjkb/neotest-haskell" },

    opts = function(_, opts)
      opts.adapters = vim.list_extend(opts.adapters or {}, { require("neotest-haskell") })
    end,
  },
}
