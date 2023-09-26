return {
  "f-person/git-blame.nvim",
  opts = {
    enabled = false,
  },
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
}
