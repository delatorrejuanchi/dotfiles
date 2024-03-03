return {
  {
    "lewis6991/gitsigns.nvim",
    dependencies = {
      {
        "folke/which-key.nvim",
        optional = true,

        opts = {
          defaults = {
            ["<leader>g"] = { name = "+git" },
            ["<leader>gh"] = { name = "+hunk" },
            ["<leader>gt"] = { name = "+toggle" },
          },
        },
      },
    },

    event = { "BufReadPre", "BufNewFile" },

    opts = {
      numhl = true,
      current_line_blame = true,

      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },

      on_attach = function(buffer)
        local gitsigns = package.loaded.gitsigns

        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = buffer, desc = desc })
        end

        map("n", "]c", gitsigns.next_hunk, "next hunk")
        map("n", "[c", gitsigns.prev_hunk, "prev hunk")

        map({ "o", "x" }, "ih", gitsigns.select_hunk, "select hunk")

        map("n", "<leader>ghs", gitsigns.stage_hunk, "stage hunk")
        map("n", "<leader>ghu", gitsigns.undo_stage_hunk, "undo stage hunk")
        map("n", "<leader>ghr", gitsigns.reset_hunk, "reset hunk")

        map("n", "<leader>gtd", gitsigns.toggle_deleted, "toggle deleted")
        map("n", "<leader>gtw", gitsigns.toggle_word_diff, "toggle word diff")
      end,

      yadm = { enable = true },
    },
  },
}
