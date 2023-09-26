return {
  "telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
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
      lsp_references = {
        show_line = false, -- https://github.com/hongxuchen/dotfiles/blob/2cc2206e5280f8d1cf2ba0a81d6648e63529b26a/_config/nvim/lua/plug/telescope/init.lua#L40
        include_declaration = false,
      },
    },
  },
}
