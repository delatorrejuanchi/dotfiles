return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    {
      "folke/which-key.nvim",
      optional = true,

      opts = {
        defaults = {
          ["<leader>s"] = { name = "+search" },
        },
      },
    },
  },

  cmd = { "Telescope" },

  keys = {
    {
      "<leader><space>",
      function()
        if vim.uv.fs_stat(vim.uv.cwd() .. "/.git") then
          require("telescope.builtin").git_files()
        else
          require("telescope.builtin").find_files()
        end
      end,
      desc = "find files",
    },
    { "<leader>.", "<cmd>Telescope buffers<CR>", desc = "buffers" },
    { "<leader>/", "<cmd>Telescope live_grep<CR>", desc = "live grep" },

    { "<leader>sh", "<cmd>Telescope help_tags<CR>", desc = "help tags" },
  },

  opts = {
    defaults = {
      path_display = { "smart" },

      layout_config = {
        prompt_position = "top",
        horizontal = { preview_width = 0.65 },
        width = 0.85,
        height = 0.85,
      },

      sorting_strategy = "ascending",
    },
  },

  config = function(_, opts)
    require("telescope").setup(opts)

    require("telescope").load_extension("fzf")
  end,
}
