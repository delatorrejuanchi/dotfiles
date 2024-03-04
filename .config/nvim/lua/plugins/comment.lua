return {
  "numToStr/Comment.nvim",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter" },
    { "JoosepAlviste/nvim-ts-context-commentstring", opts = { enable_autocmd = false } },
  },

  event = "VeryLazy",

  opts = {},

  config = function(_, opts)
    opts.pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()

    require("Comment").setup(opts)
  end,
}
