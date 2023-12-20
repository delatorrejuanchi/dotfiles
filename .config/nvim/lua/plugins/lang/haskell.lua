-- NOTE: Use LazyVim's extra when the https://github.com/LazyVim/LazyVim/pull/2052 is merged

return {
  {
    "nvim-treesitter/nvim-treesitter",

    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "haskell" })
      end
    end,
  },
  {
    "mrcjkb/haskell-tools.nvim",
    version = "^3",
    ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
    dependencies = {
      { "nvim-telescope/telescope.nvim", optional = true },
    },

    config = function()
      local ok, telescope = pcall(require, "telescope")
      if ok then
        telescope.load_extension("ht")
      end

      vim.g.haskell_tools = {
        hls = {
          settings = {
            haskell = {
              plugin = {
                stan = { globalOn = true },
              },
            },
          },
        },
      }
    end,
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      { "mrcjkb/neotest-haskell" },
    },

    opts = {
      adapters = {
        ["neotest-haskell"] = {},
      },
    },
  },
  {
    "luc-tielen/telescope_hoogle",
    ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
    },

    config = function()
      local ok, telescope = pcall(require, "telescope")
      if ok then
        telescope.load_extension("hoogle")
      end
    end,
  },
  {
    "neovim/nvim-lspconfig",

    opts = {
      setup = {
        hls = function() -- ensure that lspconfig doesn't start hls since it might conflitct with haskell-tools
          return true
        end,
      },
    },
  },
}
