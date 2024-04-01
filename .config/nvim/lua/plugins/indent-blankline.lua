local char = "│"

return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",

  event = "BufReadPre",

  opts = {
    indent = {
      char = char,
      tab_char = char,
    },
    scope = { enabled = false },
  },
}
