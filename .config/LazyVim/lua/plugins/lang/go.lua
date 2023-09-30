return {
  { import = "lazyvim.plugins.extras.lang.go" },
  {
    "mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "goimports", "golangci-lint" })
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      vim.list_extend(opts.sources, {
        nls.builtins.formatting.goimports,
        nls.builtins.diagnostics.golangci_lint,
      })
    end,
  },
}
