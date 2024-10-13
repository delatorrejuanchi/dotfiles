return {
  {
    "tpope/vim-fugitive",
    dependencies = { "tpope/vim-rhubarb" },

    keys = {
      { "<leader>gy", "<cmd>GBrowse!<CR>", mode = { "n" }, desc = "yank permalink" },
      { "<leader>gy", "<esc><cmd>'<,'>GBrowse!<CR>", mode = { "v" }, desc = "yank permalink" },
    },
  },
}
