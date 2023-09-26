return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  opts = {
    load = {
      ["core.defaults"] = {},
      ["core.concealer"] = {},
      ["core.keybinds"] = {},
      ["core.completion"] = {
        config = {
          engine = "nvim-cmp",
        },
      },
      ["core.journal"] = {},
      ["core.dirman"] = {
        config = {
          workspaces = {
            main = "~/notes",
          },
          default_workspace = "main",
        },
      },
      ["core.summary"] = {},
      ["core.ui.calendar"] = {},
    },
  },
}
