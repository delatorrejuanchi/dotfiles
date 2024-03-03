return {
  {
    "neovim/nvim-lspconfig",
    optional = true,

    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
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
          opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, { "luacheck" })
        end,
      },
    },

    opts = {
      linters_by_ft = {
        lua = { "luacheck" },
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
          opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, { "stylua" })
        end,
      },
    },

    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
      },
    },
  },
}