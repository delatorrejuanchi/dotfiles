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
}
