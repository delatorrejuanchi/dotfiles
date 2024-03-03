return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  keys = {
    { "-", "<cmd>Oil<CR>", desc = "Oil" },
  },

  opts = {
    skip_confirm_for_simple_edits = true,

    view_options = {
      show_hidden = true,
    },
  },
}
