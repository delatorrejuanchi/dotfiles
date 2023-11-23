return {
  "telescope.nvim",

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
