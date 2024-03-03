return {
  "mrjones2014/smart-splits.nvim",

  event = "VeryLazy",

  keys = {
    -- stylua: ignore start
    { "<C-Left>", function() require("smart-splits").move_cursor_left() end, desc = "Move cursor left"},
    { "<C-Down>", function() require("smart-splits").move_cursor_down() end, desc = "Move cursor down" },
    { "<C-Up>", function() require("smart-splits").move_cursor_up() end, desc = "Move cursor up" },
    { "<C-Right>", function() require("smart-splits").move_cursor_right() end, desc = "Move cursor right" },
  },

  opts = {
    at_edge = "stop",
  },
}
