return {
  "mfussenegger/nvim-dap",
  dependencies = {
    {
      "rcarriga/nvim-dap-ui",
      dependencies = { "nvim-neotest/nvim-nio" },

      -- stylua: ignore
      keys = {
        { "<leader>du", function() require("dapui").toggle() end, desc = "toggle dap ui" },
        { "<leader>de", function() require("dapui").eval() end, desc = "eval expression", mode = {"n", "v"} },
      },

      config = function(_, opts)
        local dap, dapui = require("dap"), require("dapui")

        dapui.setup(opts)

        dap.listeners.before.event_terminated["dapui_config"] = dapui.close
        dap.listeners.before.event_exited["dapui_config"] = dapui.close
      end,
    },
    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = "williamboman/mason.nvim",

      cmd = { "DapInstall", "DapUninstall" },

      opts = {},
    },
  },


  -- stylua: ignore
  keys = {
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "toggle breakpoint" },
    { "<leader>dc", function() require("dap").continue() end, desc = "continue" },
    { "<leader>dj", function() require("dap").run_to_cursor() end, desc = "jump to cursor"},
    { "<leader>ds", function() require("dap").step_over() end, desc = "step over" },
    { "<leader>di", function() require("dap").step_into() end, desc = "step into" },
    { "<leader>do", function() require("dap").step_out() end, desc = "step out" },
    { "<leader>d<Up>", function() require("dap").up() end, desc = "up" },
    { "<leader>d<Down>", function() require("dap").down() end, desc = "down" },
    { "<leader>dl", function() require("dap").run_last() end, desc = "run last" },
    { "<leader>dq", function() require("dap").terminate() end, desc = "terminate" },
  },

  config = function() end,
}
