return {
  "stevearc/conform.nvim",

  event = { "BufWritePre" },

  cmd = "ConformInfo",

  opts = {
    notify_on_error = false,
    format_after_save = { timeout_ms = 5000, lsp_fallback = true },
  },
}
