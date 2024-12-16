return {
  {
    "neovim/nvim-lspconfig",
    optional = true,

    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              usePlaceholders = true,
              staticcheck = true,
              semanticTokens = true,
              experimentalPostfixCompletions = true,
              allExperiments = true,
            },
          },
        },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,

    dependencies = {
      {
        "williamboman/mason.nvim",

        opts = function(_, opts)
          opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, { "golangci-lint" })
        end,
      },
    },

    opts = {
      linters_by_ft = {
        go = { "golangcilint" },
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
          opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, { "gci", "goimports", "golines", "gofumpt" })
        end,
      },
    },

    opts = {
      formatters_by_ft = {
        go = { "gci", "goimports", "golines", "gofumpt" },
      },

      formatters = {
        gci = {
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
          prepend_args = { "-m", "141", "--no-reformat-tags" },
        },
      },
    },
  },
  {
    "nvim-neotest/neotest",
    optional = true,

    dependencies = { "fredrikaverpil/neotest-golang" },

    opts = function(_, opts)
      require("neotest-golang")({ dap_go_enabled = require("lazy.core.config").plugins["nvim-dap"] })

      opts.adapters = vim.list_extend(opts.adapters or {}, { require("neotest-golang") })
    end,
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,

    dependencies = {
      { "leoluz/nvim-dap-go", opts = {} },
      {
        "williamboman/mason.nvim",

        opts = function(_, opts)
          opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, { "delve" })
        end,
      },
    },
  },
}
