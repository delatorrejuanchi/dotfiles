return {
  {
    "neovim/nvim-lspconfig",
    optional = true,

    opts = {
      servers = {
        ocamllsp = {},
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
          opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, { "ocamlformat" })
        end,
      },
    },

    opts = {
      formatters_by_ft = {
        ocaml = { "ocamlformat" },
      },
    },
  },
}
