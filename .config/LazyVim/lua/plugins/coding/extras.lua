return {
  { import = "lazyvim.plugins.extras.coding.yanky" },
  {
    import = "lazyvim.plugins.extras.coding.copilot",
    enabled = not vim.fn.has("macunix"),
  },
}
