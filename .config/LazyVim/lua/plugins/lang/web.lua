return {
  {
    "nvim-treesitter/nvim-treesitter",

    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "html", "css" })
    end,
  },
  {
    "williamboman/mason.nvim",

    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "html-lsp", "css-lsp", "emmet-ls" })
    end,
  },
  { import = "lazyvim.plugins.extras.lang.tailwind" },
}
