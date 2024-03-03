return {
  "folke/noice.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },

  event = "VeryLazy",

  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
      },
    },

    routes = {
      {
        filter = { event = "msg_show", find = "%d+L, %d+B" },
        opts = { skip = true },
      },
    },

    presets = {
      bottom_search = true,
    },
  },
}
