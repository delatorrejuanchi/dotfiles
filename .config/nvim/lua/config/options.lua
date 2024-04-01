vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.laststatus = 0
vim.opt.list = true
vim.opt.fillchars = { eob = " " }
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.shiftround = true
vim.opt.shortmess:append({ W = true, I = true, c = true })
vim.opt.showmode = false
vim.opt.sidescrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.undofile = true
vim.opt.smoothscroll = true
vim.opt.wrap = false

-- treesitter language overrides
vim.treesitter.language.register("bash", "zsh")

-- filetype overrides
vim.filetype.add({
  pattern = {
    [".*/hypr/.*%.conf"] = "hyprlang",
  },
})
