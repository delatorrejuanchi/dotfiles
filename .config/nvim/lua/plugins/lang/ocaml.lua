return {
  {
    "nvim-treesitter/nvim-treesitter",

    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "ocaml" })
    end,
  },
  {
    "stevearc/conform.nvim",

    opts = {
      formatters_by_ft = {
        ocaml = { "ocamlformat" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ocamllsp = {
          mason = false,
          settings = {
            codelens = { enable = true },
          },
        },
      },
    },
  },
}
