return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  event = { "BufReadPre" },

  init = function(plugin)
    require("lazy.core.loader").add_to_rtp(plugin)
    require("nvim-treesitter.query_predicates")
  end,

  opts = {
    auto_install = true,

    highlight = { enable = true },
    indent = { enable = true },
  },

  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
