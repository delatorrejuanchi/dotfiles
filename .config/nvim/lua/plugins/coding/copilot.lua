return {
  import = "lazyvim.plugins.extras.coding.copilot",
  cond = function()
    return vim.fn.getcwd():find("/Volumes/code/") ~= 1
  end,
}
