return {
  "neovim/nvim-lspconfig",
  optional = true,

  dependencies = { "b0o/SchemaStore.nvim" },

  opts = {
    servers = {
      jsonls = {
        on_new_config = function(new_config)
          new_config.settings.json.schemas = vim.list_extend(new_config.settings.json.schemas or {}, require("schemastore").json.schemas())
        end,

        settings = {
          json = {
            format = { enable = true },
            validate = { enable = true },
          },
        },
      },
    },
  },
}
