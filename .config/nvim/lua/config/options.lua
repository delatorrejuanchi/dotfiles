vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- clipboard
vim.opt.clipboard = "unnamedplus"

-- undofile
vim.opt.undofile = true

-- disable text wrap
vim.opt.wrap = false

-- less visual clutter
vim.opt.laststatus = 0
vim.opt.showmode = false
vim.opt.fillchars = { eob = " " }
vim.opt.shortmess:append({ I = true })

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- sign column
vim.opt.signcolumn = "yes"

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- scrolloff
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

-- treesitter language overrides
vim.treesitter.language.register("bash", "zsh")

-- filetype overrides
vim.filetype.add({
  pattern = {
    [".*/hypr/.*%.conf"] = "hyprlang",
  },
})
