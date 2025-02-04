return {
  {
    "saghen/blink.cmp",
    version = "*",

    event = "InsertEnter",

    opts = {
      keymap = { preset = "super-tab" },
      completion = {
        ghost_text = { enabled = false },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    },

    opts_extend = { "sources.default" },
  },
  {
    "neovim/nvim-lspconfig",
    optional = true,

    opts = function(_, opts)
      opts.capabilities = vim.tbl_deep_extend("force", opts.capabilities or {}, require("blink.cmp").get_lsp_capabilities())
    end,
  },
}
