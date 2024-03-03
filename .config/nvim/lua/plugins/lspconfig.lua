return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/neodev.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      {
        "folke/which-key.nvim",
        optional = true,

        opts = {
          defaults = {
            ["<leader>c"] = { name = "+code" },
          },
        },
      },
    },

    event = "BufReadPre",

    keys = {
      { "K", vim.lsp.buf.hover, desc = "hover documentation" },
      { "<leader>cr", vim.lsp.buf.rename, desc = "rename" },
      { "<leader>ca", vim.lsp.buf.code_action, desc = "code action" },
    },

    config = function(_, opts)
      local function setup(server)
        local server_opts = opts.servers and opts.servers[server] or {}
        if opts.capabilities then
          server_opts = vim.tbl_deep_extend("force", { capabilities = vim.deepcopy(opts.capabilities) }, server_opts)
        end

        if opts.setup and opts.setup[server] and opts.setup[server](server, server_opts) then
          return
        end

        if opts.setup and opts.setup["*"] and opts.setup["*"](server, server_opts) then
          return
        end

        require("lspconfig")[server].setup(server_opts)
      end

      local mason_lspconfig_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
      local mason_ensure_installed = {}
      for server, server_opts in pairs(opts.servers or {}) do
        if not server_opts then
          goto continue
        end

        if server_opts.mason == false or not vim.tbl_contains(mason_lspconfig_servers, server) then
          setup(server)
        else
          table.insert(mason_ensure_installed, server)
        end

        ::continue::
      end

      require("mason-lspconfig").setup({
        ensure_installed = mason_ensure_installed,
        handlers = { setup },
      })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    optional = true,

    dependencies = {
      {
        "folke/which-key.nvim",
        optional = true,

        opts = {
          defaults = {
            ["<leader>s"] = { name = "+search" },
          },
        },
      },
    },

    keys = {
      { "gd", "<cmd>Telescope lsp_definitions<CR>", desc = "goto definition" },
      { "gr", "<cmd>Telescope lsp_references<CR>", desc = "goto references" },
      { "gi", "<cmd>Telescope lsp_implementations<CR>", desc = "goto implementations" },
      { "gt", "<cmd>Telescope lsp_type_definitions<CR>", desc = "goto type definition" },

      { "<leader>ss", "<cmd>Telescope lsp_document_symbols<CR>", desc = "lsp document symbols" },
      { "<leader>sw", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", desc = "lsp workspace symbols" },
    },

    opts = {
      pickers = {
        lsp_references = {
          include_declaration = false,
          show_line = false,
        },

        lsp_incoming_calls = {
          show_line = false,
        },

        lsp_outgoing_calls = {
          show_line = false,
        },

        lsp_definitions = {
          show_line = false,
          reuse_win = true,
        },

        lsp_type_definitions = {
          show_line = false,
          reuse_win = true,
        },

        lsp_implementations = {
          show_line = false,
          reuse_win = true,
        },
      },
    },
  },
}
