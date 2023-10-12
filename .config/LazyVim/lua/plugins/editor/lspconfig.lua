local lsp_ignore_patterns = {
  "[^a-z]test[^a-z]",
  "[^a-z]mock[^a-z]",
  "Test[^a-z]",
  "Mock[^a-z]",
}

return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()

    keys[#keys + 1] = {
      "<leader>ut",
      function()
        vim.g.lsp_ignore_patterns_enabled = not vim.g.lsp_ignore_patterns_enabled
      end,
      desc = "Toggle lsp ignore pattern",
    }

    keys[#keys + 1] = {
      "gr",
      function()
        require("telescope.builtin").lsp_references({
          reuse_win = true,
          file_ignore_patterns = vim.g.lsp_ignore_patterns_enabled and lsp_ignore_patterns or {},
        })
      end,
      desc = "References",
    }

    keys[#keys + 1] = {
      "gI",
      function()
        require("telescope.builtin").lsp_implementations({
          reuse_win = true,
          file_ignore_patterns = vim.g.lsp_ignore_patterns_enabled and lsp_ignore_patterns or {},
        })
      end,
      desc = "Implementations",
    }
  end,
}
