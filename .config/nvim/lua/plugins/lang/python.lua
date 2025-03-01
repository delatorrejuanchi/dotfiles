return {
  {
    "neovim/nvim-lspconfig",
    optional = true,

    opts = {
      servers = {
        basedpyright = {},
        ruff = {},
      },
    },

    setup = function()
      -- disable hover for ruff in favor of pyright
      util.lsp.on_attach(function(client, _)
        if client.name ~= "ruff" then
          return
        end

        client.server_capabilities.hoverProvider = false
      end)
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,

    dependencies = {
      {
        "williamboman/mason.nvim",

        opts = function(_, opts)
          opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, { "black", "isort" })
        end,
      },
    },

    opts = {
      formatters_by_ft = {
        python = { "black", "isort" },
      },
    },
  },
}
