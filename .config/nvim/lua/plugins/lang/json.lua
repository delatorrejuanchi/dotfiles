return {
  { import = "lazyvim.plugins.extras.lang.json" },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "prettierd")
    end,
  },
  {
    "stevearc/conform.nvim",

    opts = {
      formatters_by_ft = {
        ["json"] = { "prettierd" },
        ["jsonc"] = { "prettierd" },
      },
    },
  },
}
