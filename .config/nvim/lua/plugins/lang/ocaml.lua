return {
  {
    "nvim-treesitter/nvim-treesitter",

    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "ocaml" })
    end,
  },
  {
    "williamboman/mason.nvim",

    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "ocaml-lsp", "ocamlformat" })
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,

    opts = {
      formatters_by_ft = {
        ocaml = { "ocamlformat" },
      },
    },
  },
}
