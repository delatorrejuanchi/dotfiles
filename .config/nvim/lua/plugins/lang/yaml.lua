return {
  "neovim/nvim-lspconfig",
  optional = true,

  dependencies = { "b0o/SchemaStore.nvim" },

  opts = {
    servers = {
      yamlls = {
        on_new_config = function(new_config)
          new_config.settings.json.schemas = vim.list_extend(new_config.settings.json.schemas or {}, require("schemastore").json.schemas())
        end,

        settings = {
          redhat = { telemetry = { enabled = false } },
          yaml = {
            keyOrdering = false,
            schemaStore = { enable = false },
          },
        },
      },
    },
    setup = {
      yamlls = function()
        -- NOTE: it seems like yamlls doesn't set the `documentFormattingProvider` capability automatically.
        util.lsp.on_attach(function(client, _)
          if client.name ~= "yamlls" then
            return
          end

          client.server_capabilities.documentFormattingProvider = true
        end)
      end,
    },
  },
}
