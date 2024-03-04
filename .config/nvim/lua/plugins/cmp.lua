return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
    },

    event = "InsertEnter",

    opts = function()
      local cmp = require("cmp")

      return {
        preselect = cmp.PreselectMode.None,

        mapping = cmp.mapping.preset.insert({
          ["<Down>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<Up>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.confirm({ select = true })
            else
              fallback()
            end
          end, { "i", "s" }),
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
    "hrsh7th/cmp-nvim-lsp",
    dependencies = {
      {
        "neovim/nvim-lspconfig",

        opts = function(_, opts)
          opts.capabilities =
            vim.tbl_deep_extend("force", opts.capabilities or {}, require("cmp_nvim_lsp").default_capabilities())
        end,
      },
    },
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
