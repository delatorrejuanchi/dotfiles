local char = "│"

return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",

    event = "BufReadPre",

    opts = {
      indent = {
        char = char,
        tab_char = char,
      },
      scope = { enabled = false },
    },
  },
  {
    "echasnovski/mini.indentscope",

    event = "BufReadPre",

    config = function(_, opts)
      local mini_indentscope = require("mini.indentscope")

      opts = vim.tbl_deep_extend("force", opts or {}, {
        draw = {
          delay = 0,
          animation = mini_indentscope.gen_animation.none(),
        },
        symbol = char,
        options = {
          try_as_border = true,
        },
      })

      mini_indentscope.setup(opts)
    end,
  },
}
