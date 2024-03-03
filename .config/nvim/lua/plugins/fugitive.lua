return {
  {
    "tpope/vim-fugitive",
    dependencies = {
      { "tpope/vim-rhubarb" },
      {
        "folke/which-key",
        optional = true,

        opts = {
          defaults = {
            ["<leader>g"] = { name = "+git" },
          },
        },
      },
    },

    keys = {
      { "<leader>gy", ":silent GBrowse!<CR>", mode = { "n", "v" }, desc = "yank permalink" },
    },
  },
}
