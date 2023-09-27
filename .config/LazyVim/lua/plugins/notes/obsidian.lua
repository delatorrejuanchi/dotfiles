local prefix = "<leader>o"
local vault = vim.fn.expand("~") .. "/obsidian/main"

return {
  {
    "epwalsh/obsidian.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
    },

    event = {
      "BufReadPre " .. vault .. "/**.md",
      "BufNewFile " .. vault .. "/**.md",
    },
    keys = {
      { prefix .. "f", "<cmd>ObsidianQuickSwitch<CR>", desc = "Quick Switch" },
      { prefix .. "t", "<cmd>ObsidianToday<CR>", desc = "Today" },
    },

    opts = {
      dir = vault,
      daily_notes = {
        folder = "journal",
      },

      use_advanced_uri = true,
      overwrite_mappings = true,
    },
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        [prefix] = { name = "+obsidian" },
      },
    },
  },
}
