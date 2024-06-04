return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },

    event = "BufReadPost",

  -- stylua: ignore
  keys = {
    { "]t", function () require("todo-comments").jump_next() end, desc = "next todo" },
    { "[t", function () require("todo-comments").jump_prev() end, desc = "prev todo" },
  },

    opts = {},
  },
  {
    "folke/trouble.nvim",
    optional = true,

    keys = {
      { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "toggle todos" },
    },
  },
}
