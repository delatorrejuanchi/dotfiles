vim.opt.cursorlineopt = "number" -- Only highlight number column
vim.opt.fillchars = { eob = " " } -- Hide ~ at end of buffer
vim.opt.laststatus = 2 -- Always show statusline

vim.opt.formatoptions:remove({ "c", "r", "o" }) -- Disable comment continuation
