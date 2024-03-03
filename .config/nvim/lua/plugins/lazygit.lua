return {
  "kdheepak/lazygit.nvim",
  dependencies = {
    {
      "folke/which-key.nvim",
      optional = true,

      opts = {
        defaults = {
          ["<leader>g"] = { name = "+git" },
        },
      },
    },
  },

  keys = {
    { "<leader>gg", "<cmd>LazyGit<CR>", desc = "lazygit" },
  },

  config = function()
    vim.g.lazygit_floating_window_border_chars = { "", "", "", "", "", "", "", "" }
  end,
}
