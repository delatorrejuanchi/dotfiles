local util = require("util")

return {
  "windwp/nvim-autopairs",

  event = "InsertEnter",

  config = function(_, opts)
    require("nvim-autopairs").setup(opts)

    util.plugin.maybe_register_load_callback("nvim-cmp", function()
      require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
    end)
  end,
}
