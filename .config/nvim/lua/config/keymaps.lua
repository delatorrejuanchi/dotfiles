local util = require("util")

-- lazy
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "Lazy" })

-- save
vim.keymap.set({ "n", "v", "i" }, "<C-s>", "<cmd>update<CR><esc>", { desc = "save" })

-- better up/down
vim.keymap.set({ "n", "x" }, "<Up>", "v:count? 'k' : 'gk'", { expr = true, desc = "up" })
vim.keymap.set({ "n", "x" }, "<Down>", "v:count? 'j' : 'gj'", { expr = true, desc = "down" })

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- move lines up/down
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==", { desc = "move line up" })
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "move line up" })
vim.keymap.set("i", "<A-Up>", "<esc>:m .-2<CR>==gi", { desc = "move line up" })
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==", { desc = "move line down" })
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "move line down" })
vim.keymap.set("i", "<A-Down>", "<esc>:m .+1<CR>==gi", { desc = "move line down" })

-- splits
vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "split window horizontally" })
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "split window vertically" })

-- buffer navigation
vim.keymap.set("n", "<leader>,", "<cmd>e #<CR>", { desc = "switch to last buffer" })

-- clear search with escape
vim.keymap.set("n", "<esc>", "<cmd>noh<CR><esc>", { silent = true })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.keymap.set("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "next search result" })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "next search result" })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "next search result" })
vim.keymap.set("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "prev search result" })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "prev search result" })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "prev search result" })

-- next/prev
vim.keymap.set("n", "]q", vim.cmd.cnext, { desc = "next quickfix" })
vim.keymap.set("n", "[q", vim.cmd.cprev, { desc = "prev quickfix" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "next diagnostic" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "prev diagnostic" })

-- goto
vim.keymap.set("n", "g.", "gi", { desc = "goto last insertion and insert" })
vim.keymap.set("n", "g,", "gv", { desc = "goto last visual selection" })

-- quit
vim.keymap.set("n", "<leader>q", "<cmd>qa<CR>", { desc = "quit" })

-- lazygit
vim.keymap.set("n", "<leader>gg", util.git.lazygit, { desc = "lazygit" })
