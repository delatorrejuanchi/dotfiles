vim.opt.cursorlineopt = "number" -- Only highlight number column
vim.opt.fillchars = { eob = " " } -- Hide ~ at end of buffer
vim.opt.laststatus = 2 -- Always show statusline

vim.opt.formatoptions = vim.opt.formatoptions - "r" -- Don't insert comment leader after hitting <Enter>
vim.opt.formatoptions = vim.opt.formatoptions - "o" -- Don't insert comment leader after hitting o or O
