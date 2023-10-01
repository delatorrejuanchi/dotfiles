-- Add undo break-points
vim.api.nvim_set_keymap("i", ".", ".<c-g>u", { noremap = true })
vim.api.nvim_set_keymap("i", ",", ",<c-g>u", { noremap = true })
vim.api.nvim_set_keymap("i", ";", ";<c-g>u", { noremap = true })
vim.api.nvim_set_keymap("i", "<CR>", "<CR><c-g>u", { noremap = true })
