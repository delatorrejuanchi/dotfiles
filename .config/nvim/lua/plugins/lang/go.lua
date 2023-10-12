return {
  { import = "lazyvim.plugins.extras.lang.go" },
  {
    "williamboman/mason.nvim",

    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "golangci-lint", "gofumpt" })
    end,
  },
  {
    "mfussenegger/nvim-lint",

    opts = {
      linters_by_ft = {
        go = { "golangcilint" },
      },
    },
  },
  {
    "stevearc/conform.nvim",

    opts = {
      formatters_by_ft = {
        go = { "gofumpt" },
      },
    },
  },
}
