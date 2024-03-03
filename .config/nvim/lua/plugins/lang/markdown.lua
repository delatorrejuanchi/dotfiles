return {
  {
    "neovim/nvim-lspconfig",
    optional = true,

    opts = {
      servers = {
        marksman = {},
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,

    dependencies = {
      {
        "williamboman/mason.nvim",

        opts = function(_, opts)
          opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, { "markdownlint" })
        end,
      },
    },

    opts = {
      linters_by_ft = {
        markdown = { "markdownlint" },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,

    dependencies = {
      {
        "williamboman/mason.nvim",

        opts = function(_, opts)
          opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, { "markdownlint" })
        end,
      },
    },

    opts = {
      formatters_by_ft = {
        markdown = { "markdownlint" },
      },
    },
  },
}
