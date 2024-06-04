local function setup_servers(servers, setup, capabilities)
  local function handle(server)
    local opts = vim.tbl_deep_extend(
      "force",
      { capabilities = vim.lsp.protocol.make_client_capabilities() },
      { capabilities = capabilities },
      servers[server] or {}
    )

    if setup and setup[server] and setup[server](server, opts) then
      return
    end

    if setup and setup["*"] and setup["*"](server, opts) then
      return
    end

    require("lspconfig")[server].setup(opts)
  end

  local mason_lspconfig_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
  local mason_ensure_installed = {}
  for server, server_opts in pairs(servers) do
    if not server_opts then
      goto continue
    end

    if server_opts.mason == false or not vim.tbl_contains(mason_lspconfig_servers, server) then
      handle(server)
    else
      table.insert(mason_ensure_installed, server)
    end

    ::continue::
  end

  require("mason-lspconfig").setup({ ensure_installed = mason_ensure_installed, handlers = { handle } })
end

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/neodev.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },

    event = "BufReadPre",

    keys = {
      {
        "grr",
        function()
          vim.lsp.buf.references({ include_declaration = false }, {
            on_list = function(t)
              vim.fn.setqflist({}, " ", t)
              if #t.items > 1 then
                vim.cmd("copen")
              end

              vim.cmd.cfirst()
            end,
          })
        end,
      },
    },

    config = function(_, opts)
      util.lsp.on_attach(function(client, bufnr)
        if client.supports_method("textDocument/codeLens") then
          vim.lsp.codelens.refresh({ bufnr = bufnr })

          vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
            buffer = bufnr,
            callback = function()
              vim.lsp.codelens.refresh({ bufnr = bufnr })
            end,
          })
        end
      end)

      if opts.servers then
        setup_servers(opts.servers, opts.setup, opts.capabilities)
      end
    end,
  },
}
