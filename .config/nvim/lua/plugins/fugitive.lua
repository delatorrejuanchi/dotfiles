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
            ["<leader>ga"] = { name = "+add" },
          },
        },
      },
      {
        "seanbreckenridge/yadm-git.vim",

        config = function()
          vim.g.yadm_git_gitgutter_enabled = 0
        end,
      },
    },

    event = "VeryLazy",

    keys = {
      { "<leader>ga.", "<cmd>Git add %<CR>", mode = { "n" }, desc = "buffer" },
      { "<leader>gaa", "<cmd>Git add .<CR>", mode = { "n" }, desc = "all" },
      { "<leader>gy", "<cmd>GBrowse!<CR>", mode = { "n" }, desc = "yank permalink" },
      { "<leader>gy", "<esc><cmd>'<,'>GBrowse!<CR>", mode = { "v" }, desc = "yank permalink" },
    },
  },
}
