local util = require("util")

return {
  {
    "windwp/nvim-autopairs",

    event = "InsertEnter",

    opts = {},
  },
  {
    "hrsh7th/nvim-cmp",
    optional = true,

    init = function()
      util.on_load("nvim-cmp", function()
        require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
      end)
    end,
  },
}
