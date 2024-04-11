return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/nvim-nio",
  },

  keys = {
      -- stylua: ignore start
      { "<leader>tr", function() require("neotest").run.run() end, desc = "run test" },
      { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "run tests in file" },
      { "<leader>ta", function() require("neotest").run.run({ suite = true }) end, desc = "run all tests" },
      { "<leader>tl", function() require("neotest").run.run_last() end, desc = "run last test" },

      { "<leader>tx", function() require("neotest").run.stop() end, desc = "stop tests"},

      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "toggle summary" },
      { "<leader>to", function() require("neotest").output_panel.toggle() end, desc = "toggle output panel" },
  },

  opts = {
    output = { enabled = false },
    output_panel = { enabled = true },
    quickfix = { enabled = true },

    running = {
      concurrent = true,
    },
  },
}
