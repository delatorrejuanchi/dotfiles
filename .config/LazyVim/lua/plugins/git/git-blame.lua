return {
  "f-person/git-blame.nvim",

  keys = {
    {
      "<leader>gY",
      function()
        require("gitblame").copy_commit_url_to_clipboard()
      end,
      mode = { "n", "v" },
      desc = "Yank commit link",
    },
  },

  opts = {
    enabled = false,
  },
}
