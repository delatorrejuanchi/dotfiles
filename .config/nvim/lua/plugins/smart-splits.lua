return {
  "mrjones2014/smart-splits.nvim",

  event = "VeryLazy",

  keys = {
    -- stylua: ignore start
    { "<C-Left>", function() require("smart-splits").move_cursor_left() end, desc = "Move cursor left" },
    { "<C-Down>", function() require("smart-splits").move_cursor_down() end, desc = "Move cursor down" },
    { "<C-Up>", function() require("smart-splits").move_cursor_up() end, desc = "Move cursor up" },
    { "<C-Right>", function() require("smart-splits").move_cursor_right() end, desc = "Move cursor right" },

    { "<C-S-Left>", function () require("smart-splits").resize_left() end, desc = "Resize left" },
    { "<C-S-Down>", function () require("smart-splits").resize_down() end, desc = "Resize down" },
    { "<C-S-Up>", function () require("smart-splits").resize_up() end, desc = "Resize up" },
    { "<C-S-Right>", function () require("smart-splits").resize_right() end, desc = "Resize right" },
  },

  opts = {
    at_edge = "stop",
  },
}
