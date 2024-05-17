return {
  {
    "neovim/nvim-lspconfig",
    optional = true,

    opts = {
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
          },
        },
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,

    opts = function()
      local dap = require("dap")

      dap.adapters.cppdbg = {
        id = "cppdbg",
        type = "executable",
        command = "gdb",
        args = { "--quiet", "--interpreter=dap" },
      }

      for _, lang in ipairs({ "c", "cpp" }) do
        dap.configurations[lang] = {
          {
            name = "Run executable (GDB)",
            type = "gdb",
            request = "launch",
            -- This requires special handling of 'run_last', see
            -- https://github.com/mfussenegger/nvim-dap/issues/1025#issuecomment-1695852355
            program = function()
              local path = vim.fn.input({
                prompt = "Path to executable: ",
                default = vim.fn.getcwd() .. "/",
                completion = "file",
              })

              return (path and path ~= "") and path or dap.ABORT
            end,
          },
          {
            name = "Run executable with arguments (GDB)",
            type = "gdb",
            request = "launch",
            -- This requires special handling of 'run_last', see
            -- https://github.com/mfussenegger/nvim-dap/issues/1025#issuecomment-1695852355
            program = function()
              local path = vim.fn.input({
                prompt = "Path to executable: ",
                default = vim.fn.getcwd() .. "/",
                completion = "file",
              })

              return (path and path ~= "") and path or dap.ABORT
            end,
            args = function()
              local args_str = vim.fn.input({
                prompt = "Arguments: ",
              })
              return vim.split(args_str, " +")
            end,
          },
          {
            name = "Attach to process (GDB)",
            type = "gdb",
            request = "attach",
            processId = require("dap.utils").pick_process,
          },
        }
      end

      require("dap.ext.vscode").load_launchjs(nil, { cppdbg = { "c", "cpp" } })
    end,
  },
}
