return {
  { "echasnovski/mini.pairs", enabled = false },
  {
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" },

    opts = {
      tabout = {
        enable = true,
        hopout = true,
      },
    },
  },
}
