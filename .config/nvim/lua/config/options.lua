vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- clipboard
if not vim.env.SSH_TTY then -- NOTE: only set clipboard if not in ssh (see `:h clipboard-osc52`)
  vim.schedule(function()
    vim.opt.clipboard = "unnamedplus"
  end)
end

-- undofile
vim.opt.undofile = true

-- disable text wrap
vim.opt.wrap = false

-- winbar
vim.opt.winbar = "%< %f"

-- less visual clutter
vim.opt.laststatus = 0
vim.opt.statusline = "%{repeat('─',winwidth('.'))}"
vim.opt.cmdheight = 0
vim.opt.showmode = false
vim.opt.fillchars = { eob = " " }
vim.opt.shortmess:append({ I = true, c = true, C = true })

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- sign column
vim.opt.signcolumn = "yes"

-- folds
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- split
vim.opt.splitbelow = true
vim.opt.splitright = true

-- sessions
vim.opt.sessionoptions:remove("blank")
vim.opt.sessionoptions:remove("buffers")
vim.opt.sessionoptions:remove("tabpages")
