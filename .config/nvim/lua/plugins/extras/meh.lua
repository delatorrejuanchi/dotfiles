local meh_1 = "<C-M-!>"
local meh_2 = "<C-M-@>"

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
