-- Bind H and L to move by word.
vim.keymap.set("n", "H", "b", { noremap = true })
vim.keymap.set("n", "L", "w", { noremap = true })

-- Telescope ignore patterns
local telescope_ignore_patterns = {
  "[^a-z]test[^a-z]",
  "[^a-z]mock[^a-z]",
  "[^a-z]stub[^a-z]",
  "Test[^a-z]",
  "Mock[^a-z]",
  "Stub[^a-z]",
}

vim.keymap.set("n", "<leader>uI", function()
  vim.g.telescope_ignore_enabled = not vim.g.telescope_ignore_enabled

  require("telescope.config").set_defaults({
    file_ignore_patterns = vim.g.telescope_ignore_enabled and telescope_ignore_patterns or {},
  })
end, { noremap = true, desc = "Toggle telescope ignore patterns" })

-- Disable unused keymaps
vim.keymap.del({ "i", "x", "n", "s" }, "<C-s>") -- Save file
vim.keymap.del("n", "<leader>K") -- keywordprg

vim.keymap.del("n", "<leader>us") -- Toggle Spelling
vim.keymap.del("n", "<leader>uw") -- Toggle Word Wrap
vim.keymap.del("n", "<leader>uL") -- Toggle Relative Line Numbers
vim.keymap.del("n", "<leader>ul") -- Toggle Line Numbers
vim.keymap.del("n", "<leader>ud") -- Toggle Diagnostics
vim.keymap.del("n", "<leader>uc") -- Toggle Conceal

vim.keymap.del("n", "<leader>gG") -- Lazygit (cwd)

vim.keymap.del("n", "<leader>ft") -- Terminal (root dir)
vim.keymap.del("n", "<leader>fT") -- Terminal (cwd)
vim.keymap.del("n", "<c-/>") -- Terminal (root dir)

vim.keymap.del("n", "<leader>ww") -- Other window
vim.keymap.del("n", "<leader>wd") -- Delete window
vim.keymap.del("n", "<leader>w-") -- Split window below
vim.keymap.del("n", "<leader>w|") -- Split window right

vim.keymap.del("n", "<leader><tab>l") -- Last Tab
vim.keymap.del("n", "<leader><tab>f") -- First Tab
vim.keymap.del("n", "<leader><tab><tab>") -- New Tab
vim.keymap.del("n", "<leader><tab>]") -- Next Tab
vim.keymap.del("n", "<leader><tab>d") -- Close Tab
vim.keymap.del("n", "<leader><tab>[") -- Previous Tab
