return {
  "ruifm/gitlinker.nvim",

  keys = {
    {
      "<leader>gy",
      function()
        require("gitlinker").get_buf_range_url(string.lower(vim.api.nvim_get_mode()["mode"]))
      end,
      mode = { "n", "v" },
      desc = "Yank git link",
    },
  },

  opts = {
    mappings = nil,
    print_url = false,
  },
}
