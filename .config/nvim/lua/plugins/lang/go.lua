return {
  {
    "neovim/nvim-lspconfig",
    optional = true,

    init = function()
      -- workaround for gopls not supporting semanticTokensProvider (ref: https://github.com/golang/go/issues/54531#issuecomment-1464982242)
      util.lsp.on_attach(function(client, _)
        if client.name ~= "gopls" then
          return
        end

        if not client.server_capabilities.semanticTokensProvider then
          client.server_capabilities.semanticTokensProvider = {
            full = true,
            legend = {
              tokenTypes = client.config.capabilities.textDocument.semanticTokens.tokenTypes,
              tokenModifiers = client.config.capabilities.textDocument.semanticTokens.tokenModifiers,
            },
            range = true,
          }
        end
      end)
    end,

    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              usePlaceholders = true,
              staticcheck = true,
              semanticTokens = true,
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

    dependencies = { "nvim-neotest/neotest-go" },

    opts = function(_, opts)
      require("neotest-go")({ recursive_run = true })

      opts.adapters = vim.list_extend(opts.adapters or {}, { require("neotest-go") })
    end,
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,

    dependencies = {
      { "leoluz/nvim-dap-go", opts = {} },
    },
  },
}
