local meh_1 = "<C-M-!>"
local meh_2 = "<C-M-@>"
local meh_3 = "<C-M-#>"

return {
  {
    "hrsh7th/nvim-cmp",
    optional = true,

    keys = {
      {
        meh_1,
        mode = "i",
        function()
          require("cmp").confirm({ select = true })
        end,
        desc = "confirm completion",
      },
      {
        meh_3,
        mode = "i",
        "<cmd>lua vim.snippet.jump(1)<CR>",
        desc = "snippet jump forward",
      },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    optional = true,

    keys = {
      {
        meh_2,
        mode = "i",
        function()
          local suggestion = require("copilot.suggestion")

          if suggestion.is_visible() then
            suggestion.accept()
          else
            suggestion.next()
          end
        end,
        desc = "accept/trigger suggestion",
      },
    },
  },
}
