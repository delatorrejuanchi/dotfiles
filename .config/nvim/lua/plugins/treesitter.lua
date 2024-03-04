return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  dependencies = {
    { "nvim-treesitter/nvim-treesitter-textobjects" },
  },

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
    textobjects = {
      select = {
        enable = true,

        lookahead = true,

        keymaps = {
          ["af"] = { query = "@function.outer", desc = "around function" },
          ["if"] = { query = "@function.inner", desc = "inside function" },

          ["aa"] = { query = "@parameter.outer", desc = "around argument" },
          ["ia"] = { query = "@parameter.inner", desc = "inside argument" },
        },

        include_surrounding_whitespace = true,
      },
    },
  },

  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
