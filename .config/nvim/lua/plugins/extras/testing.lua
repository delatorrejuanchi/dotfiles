return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },

    opts = {
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
  },
}
