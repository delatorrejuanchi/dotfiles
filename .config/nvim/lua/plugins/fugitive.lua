return {
  {
    "tpope/vim-fugitive",
    dependencies = {
      { "tpope/vim-rhubarb" },
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
      { "<leader>gy", "<cmd>GBrowse!<CR>", mode = { "n" }, desc = "yank permalink" },
      { "<leader>gy", "<esc><cmd>'<,'>GBrowse!<CR>", mode = { "v" }, desc = "yank permalink" },
    },
  },
}
