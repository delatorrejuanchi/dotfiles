return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      { "hrsh7th/cmp-nvim-lsp", optional = true },
    },

    event = "InsertEnter",

    opts = function()
      local cmp = require("cmp")

      return {
        mapping = cmp.mapping.preset.insert({
          ["<C-y>"] = { i = cmp.mapping.confirm({ select = true }) },
        }),

        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },

        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "path" },
          { name = "buffer" },
        }),
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    optional = true,

    dependencies = { "hrsh7th/cmp-nvim-lsp" },

    opts = function(_, opts)
      opts.capabilities = vim.tbl_deep_extend("force", opts.capabilities or {}, require("cmp_nvim_lsp").default_capabilities())
    end,
  },
  {
    "folke/noice.nvim",
    optional = true,

    opts = {
      lsp = {
        override = {
          ["cmp.entry.get_documentation"] = true,
        },
      },
    },
  },
}
