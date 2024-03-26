return {
  {
    "tpope/vim-fugitive",
    dependencies = {
      { "tpope/vim-rhubarb" },
      {
        "seanbreckenridge/yadm-git.vim",

        config = function()
          vim.g.yadm_git_gitgutter_enabled = 0
        end,
      },
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
    },

    keys = {
      { "<leader>ga.", "<cmd>Git add %<CR>", mode = { "n" }, desc = "buffer" },
      { "<leader>gaa", "<cmd>Git add .<CR>", mode = { "n" }, desc = "all" },
      { "<leader>gc", "<cmd>Git commit<CR>", mode = { "n" }, desc = "commit" },
      { "<leader>gP", "<cmd>Git push<CR>", mode = { "n" }, desc = "push" },
      { "<leader>gp", "<cmd>Git pull<CR>", mode = { "n" }, desc = "pull" },
      { "<leader>gy", "<cmd>GBrowse<CR>", mode = { "n" }, desc = "yank permalink" },
      { "<leader>gy", "<esc><cmd>GBrowse<CR>", mode = { "v" }, desc = "yank permalink" },
      { "<leader>gy", "<cmd>GBrowse!<CR>", mode = { "n" }, desc = "yank permalink" },
      { "<leader>gy", "<esc><cmd>'<,'>GBrowse!<CR>", mode = { "v" }, desc = "yank permalink" },
    },
  },
}
