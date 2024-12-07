return {
  "neovim/nvim-lspconfig",
  optional = true,

  dependencies = { "b0o/SchemaStore.nvim" },

  opts = {
    servers = {
      yamlls = {
        on_new_config = function(new_config)
          new_config.settings.yaml.schemas = vim.list_extend(new_config.settings.yaml.schemas or {}, require("schemastore").yaml.schemas())
        end,

        settings = {
          redhat = { telemetry = { enabled = false } },
          yaml = {
            keyOrdering = false,
            format = {
              enable = true,
            },
            schemaStore = { enable = false },
          },
        },
      },
    },
  },
}
