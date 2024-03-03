return {
  "folke/which-key.nvim",

  event = "VeryLazy",

  opts = {
    defaults = {
      ["g"] = { name = "+goto" },
      ["]"] = { name = "+next" },
      ["["] = { name = "+prev" },
      ["<leader>"] = { name = "+leader" },
    },
  },

  config = function(_, opts)
    local which_key = require("which-key")

    which_key.setup(opts)
    which_key.register(opts.defaults)
  end,
}
