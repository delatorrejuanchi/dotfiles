return {
  "neovim/nvim-lspconfig",

  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()

    -- disable unused keymaps
    keys[#keys + 1] = { "<leader>cl", false } -- Lsp Info
    keys[#keys + 1] = { "gD", false } -- Goto Declaration
    keys[#keys + 1] = { "gK", false } -- Signature Help
    keys[#keys + 1] = { "<c-k>", false } -- Signature Help
    keys[#keys + 1] = { "<leader>cA", false } -- Source Action
  end,
}
