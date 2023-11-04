if vim.fn.getcwd():find("/Volumes/code/") == 1 then
  return {}
end

return { import = "lazyvim.plugins.extras.coding.copilot" }
