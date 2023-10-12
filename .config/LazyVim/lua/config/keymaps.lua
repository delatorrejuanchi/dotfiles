-- Add undo break-points
vim.api.nvim_set_keymap("i", ".", ".<c-g>u", { noremap = true })
vim.api.nvim_set_keymap("i", ",", ",<c-g>u", { noremap = true })
vim.api.nvim_set_keymap("i", ";", ";<c-g>u", { noremap = true })
vim.api.nvim_set_keymap("i", "<CR>", "<CR><c-g>u", { noremap = true })

-- Bind H and L to move by word.
vim.api.nvim_set_keymap("n", "H", "b", { noremap = true })
vim.api.nvim_set_keymap("n", "L", "w", { noremap = true })
