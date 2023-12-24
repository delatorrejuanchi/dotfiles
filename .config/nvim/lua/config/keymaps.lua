local Util = require("lazy.core.util")

-- smart-split navigation
vim.keymap.set({ "i", "n" }, "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set({ "i", "n" }, "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set({ "i", "n" }, "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set({ "i", "n" }, "<C-l>", require("smart-splits").move_cursor_right)
vim.keymap.set({ "i", "n" }, "<C-M-h>", require("smart-splits").resize_left)
vim.keymap.set({ "i", "n" }, "<C-M-j>", require("smart-splits").resize_down)
vim.keymap.set({ "i", "n" }, "<C-M-k>", require("smart-splits").resize_up)
vim.keymap.set({ "i", "n" }, "<C-M-l>", require("smart-splits").resize_right)
vim.keymap.set({ "i", "n" }, "<C-S-h>", require("smart-splits").swap_buf_left)
vim.keymap.set({ "i", "n" }, "<C-S-j>", require("smart-splits").swap_buf_down)
vim.keymap.set({ "i", "n" }, "<C-S-k>", require("smart-splits").swap_buf_up)
vim.keymap.set({ "i", "n" }, "<C-S-l>", require("smart-splits").swap_buf_right)

-- Telescope ignore patterns
local telescope_ignore_patterns = {
  "[^a-z]test[^a-z]",
  "[^a-z]mock[^a-z]",
  "Test[^a-z]",
  "Mock[^a-z]",
}

vim.keymap.set("n", "<leader>uI", function()
  vim.g.telescope_ignore_enabled = not vim.g.telescope_ignore_enabled
  Util.info("Telescope ignore patterns: " .. (vim.g.telescope_ignore_enabled and "enabled" or "disabled"))

  require("telescope.config").set_defaults({
    file_ignore_patterns = vim.g.telescope_ignore_enabled and telescope_ignore_patterns or {},
  })
end, { noremap = true, desc = "Toggle telescope ignore patterns" })

-- Disable unused keymaps
vim.keymap.del({ "i", "x", "n", "s" }, "<C-s>") -- Save file
vim.keymap.del("n", "<leader>K") -- keywordprg

-- vim.keymap.del("n", "<leader>gG") -- Lazygit (cwd)

vim.keymap.del("n", "<leader>ft") -- Terminal (root dir)
vim.keymap.del("n", "<leader>fT") -- Terminal (cwd)
vim.keymap.del("n", "<C-/>") -- Terminal (root dir)
vim.keymap.del("n", "<C-_>") -- which-key

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
