return {
  "folke/which-key.nvim",

  event = "VeryLazy",

  opts = {
    defaults = {
      ["g"] = { name = "+goto" },
      ["]"] = { name = "+next" },
      ["["] = { name = "+prev" },
      ["<leader>"] = { name = "+leader" },
    },
  },
}
