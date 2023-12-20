return {
  "neovim/nvim-lspconfig",

  opts = {
    diagnostics = {
      signs = {
        text = {
          -- These can be removed after https://github.com/LazyVim/LazyVim/pull/2192 is merged
          [vim.diagnostic.severity.ERROR] = require("lazyvim.config").icons.diagnostics.Error,
          [vim.diagnostic.severity.WARN] = require("lazyvim.config").icons.diagnostics.Warn,
          [vim.diagnostic.severity.HINT] = require("lazyvim.config").icons.diagnostics.Hint,
          [vim.diagnostic.severity.INFO] = require("lazyvim.config").icons.diagnostics.Info,
        },
      },
    },
  },
}
