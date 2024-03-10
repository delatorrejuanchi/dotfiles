return {
  {
    "folke/which-key.nvim",
    optional = true,

    opts = {
      defaults = {
        ["<leader>t"] = { name = "+test" },
        ["<leader>d"] = { name = "+debug" },
      },
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "folke/trouble.nvim",
    },

    keys = {
      -- stylua: ignore start
      { "<leader>tr", function() require("neotest").run.run() end, desc = "run test" },
      { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "run tests" },
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
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",

        config = function(_, opts)
          local dap, dapui = require("dap"), require("dapui")

          dapui.setup(opts)

          dap.listeners.before.attach.dapui_config = dapui.open
          dap.listeners.before.launch.dapui_config = dapui.open
          dap.listeners.before.event_terminated.dapui_config = dapui.close
          dap.listeners.before.event_exited.dapui_config = dapui.close
        end,
      },
      {
        "jay-babu/mason-nvim-dap.nvim",
        optional = true,

        dependencies = { "williamboman/mason.nvim" },

        cmd = { "DapInstall", "DapUninstall" },

        opts = {},
      },
    },

    keys = {
      -- stylua: ignore start
      { "<leader>tdr", function() require("neotest").run.run({ strategy = "dap"}) end, desc = "debug test" },
      { "<leader>tdf", function() require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" }) end, desc = "debug tests" },
      { "<leader>tda", function() require("neotest").run.run({ suite = true, strategy = "dap" }) end, desc = "debug all tests" },
      { "<leader>tdl", function() require("neotest").run.run_last({ strategy = "dap" }) end, desc = "debug last test" },

      { "<leader>tdb", function() require("dap").toggle_breakpoint() end, desc = "toggle breakpoint"},
    },
  },
}
