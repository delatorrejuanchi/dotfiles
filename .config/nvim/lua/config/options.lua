vim.opt.cursorlineopt = "number" -- Only highlight number column
vim.opt.fillchars = { eob = " " } -- Hide ~ at end of buffer
vim.opt.laststatus = 2 -- Always show statusline
vim.opt.pumblend = 0 -- Popup menu transparency
vim.opt.conceallevel = 2 -- Conceal text

vim.filetype.add({
  filename = {
    ["yabairc"] = "sh",
    ["skhdrc"] = "config",
  },
})
