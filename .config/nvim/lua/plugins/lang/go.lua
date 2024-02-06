return {
  { import = "lazyvim.plugins.extras.lang.go" },
  {
    "williamboman/mason.nvim",

    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "golangci-lint" })
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
        go = { "goimports", "gofumpt", "gci", "golines" },
      },

      formatters = {
        gci = {
          command = "gci",
          stdin = false,
          args = {
            "write",
            "--skip-generated",
            "--section=standard",
            "--section=localmodule",
            "--section=Prefix(github.com/PaddleHQ)",
            "--section=default",
            "--custom-order",
            "$FILENAME",
          },
        },

        golines = {
          prepend_args = { "-m", "140", "--no-reformat-tags" },
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              codelenses = {
                gc_details = true,
              },
              analyses = {
                fieldalignment = false,
              },
              usePlaceholders = false,
            },
          },
        },
      },
    },
  },
}
