return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },

  event = { "BufReadPre" },

  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },

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

      move = {
        enable = true,

        goto_next_start = { ["]f"] = "@function.outer", ["]if"] = "@function.inner" },
        goto_previous_start = { ["[f"] = "@function.outer", ["[if"] = "@function.inner" },
      },
    },
  },

  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
