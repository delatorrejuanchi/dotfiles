local prefix = "<leader>gw"

return {
  {
    "ThePrimeagen/git-worktree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },

    event = "VeryLazy",

    keys = {
      {
        prefix .. "n",
        function()
          local actions = require("telescope.actions")
          local action_state = require("telescope.actions.state")

          require("telescope.builtin").git_branches({
            attach_mappings = function()
              actions.select_default:replace(function(prompt_bufnr, _)
                local selected_entry = action_state.get_selected_entry()
                local current_line = action_state.get_current_line()

                actions.close(prompt_bufnr)

                local branch = selected_entry ~= nil and selected_entry.value or current_line

                if branch == nil then
                  return
                end

                require("git-worktree").create_worktree(branch, branch)
              end)

              return true
            end,
          })
        end,
        desc = "New worktree",
      },
      {
        prefix .. "s",
        "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",
        desc = "Switch worktree",
      },
    },

    config = function()
      require("lazyvim.util").on_load("telescope.nvim", function()
        require("telescope").load_extension("git_worktree")
      end)
    end,
  },
  {
    "folke/which-key.nvim",
    optional = true,

    opts = {
      defaults = {
        [prefix] = { name = "+worktree" },
      },
    },
  },
}
