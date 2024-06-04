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
          ["<Tab>"] = { i = cmp.mapping.confirm({ select = true }) },
        }),

        snippet = {
          expand = function(args)
            -- Native sessions don't support nested snippet sessions.
            -- Always use the top-level session.
            -- Otherwise, when on the first placeholder and selecting a new completion,
            -- the nested session will be used instead of the top-level session.
            local session = vim.snippet.active() and vim.snippet._session or nil

            vim.snippet.expand(args.body)

            -- Restore top-level session when needed
            if session then
              vim.snippet._session = session
            end
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
