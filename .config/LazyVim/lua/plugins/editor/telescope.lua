return {
  "telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },

  opts = {
    defaults = {
      path_display = { "smart" },
      layout_config = {
        prompt_position = "top",
        horizontal = { preview_width = 0.65 },
        width = 0.95,
        height = 0.95,
      },
      sorting_strategy = "ascending",
    },
    pickers = {
      -- https://github.com/hongxuchen/dotfiles/blob/302c37fc1bf6dc67f97c3c732e0c54df6da308f3/_config/nvim/lua/plug/telescope/init.lua#L40
      lsp_references = {
        show_line = false,
        include_declaration = false,
      },
      lsp_implementations = {
        show_line = false,
      },
      lsp_incoming_calls = {
        show_line = false,
      },
      lsp_outgoing_calls = {
        show_line = false,
      },
    },
  },
}
