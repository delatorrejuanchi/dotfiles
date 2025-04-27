return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },

  cmd = { "Telescope" },

  keys = {
    { "<leader><space>", "<cmd>Telescope find_files<CR>", desc = "find files" },
    { "<leader>.", "<cmd>Telescope buffers<CR>", desc = "buffers" },
    { "<leader>/", "<cmd>Telescope live_grep<CR>", desc = "live grep" },
  },

  opts = {
    defaults = {
      path_display = { "smart" },

      layout_config = {
        prompt_position = "top",
        horizontal = { preview_width = 0.65 },
        width = { padding = 0 },
        height = { padding = 0 },
      },

      sorting_strategy = "ascending",
    },

    pickers = {
      find_files = {
        hidden = true,
      },
    },
  },

  config = function(_, opts)
    require("telescope").setup(opts)

    require("telescope").load_extension("fzf")
  end,
}
