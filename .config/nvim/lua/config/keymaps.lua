-- Bind H and L to move by word.
vim.keymap.set("n", "H", "b", { noremap = true })
vim.keymap.set("n", "L", "w", { noremap = true })

-- Telescope ignore patterns
local telescope_ignore_patterns = {
  "[^a-z]test[^a-z]",
  "[^a-z]mock[^a-z]",
  "Test[^a-z]",
  "Mock[^a-z]",
}

vim.keymap.set("n", "<leader>uI", function()
  vim.g.telescope_ignore_enabled = not vim.g.telescope_ignore_enabled

  require("telescope.config").set_defaults({
    file_ignore_patterns = vim.g.tele_ignore_enabled and telescope_ignore_patterns or {},
  })
end, { noremap = true, desc = "Toggle telescope ignore patterns" })
