return {
  {
    "ThePrimeagen/refactoring.nvim",
    cmd = "Refactor",
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      vim.list_extend(opts.sources, {
        nls.builtins.code_actions.refactoring,
      })
    end,
  },
}
