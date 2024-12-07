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
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },

    ft = "markdown",

    opts = {
      code = {
        sign = false,
        width = "block",
        left_pad = 1,
        right_pad = 1,
      },
      heading = {
        sign = false,
        icons = {},
      },
    },
  },
}
