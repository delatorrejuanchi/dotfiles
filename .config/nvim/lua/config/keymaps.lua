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

-- buffers
vim.keymap.set("n", "<leader>,", "<cmd>e#<CR>", { desc = "switch to last buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bd|e#<CR>", { desc = "close all buffers except current" })

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

-- goto
vim.keymap.set("n", "g.", "gi", { desc = "goto last insertion and insert" })
vim.keymap.set("n", "g,", "gv", { desc = "goto last visual selection" })

-- quit
vim.keymap.set("n", "<leader>q", "<cmd>qa<CR>", { desc = "quit" })

-- lazygit
vim.keymap.set("n", "<leader>gg", util.git.lazygit, { desc = "lazygit" })

-- notes
vim.keymap.set("n", "<leader>of", util.notes.find, { desc = "find notes" })
vim.keymap.set("n", "<leader>o/", util.notes.live_grep, { desc = "live grep notes" })
vim.keymap.set("n", "<leader>on", util.notes.new, { desc = "new note" })
vim.keymap.set("n", "<leader>ot", util.notes.today, { desc = "today's note" })
vim.keymap.set("n", "<leader>oo", util.notes.scratchpad, { desc = "scratchpad" })
vim.keymap.set("n", "<leader>op", util.notes.move_to_projects, { desc = "move to projects" })
vim.keymap.set("n", "<leader>oa", util.notes.move_to_areas, { desc = "move to areas" })
vim.keymap.set("n", "<leader>or", util.notes.move_to_resources, { desc = "move to resources" })
vim.keymap.set("n", "<leader>od", util.notes.move_to_archive, { desc = "move to archive" })

-- quick grep
-- stylua: ignore start
vim.keymap.set("n", "<leader>ct", function() util.quick_grep("TODO") end, { desc = "find TODOs" })
vim.keymap.set("n", "<leader>cf", function() util.quick_grep("FIXME") end, { desc = "find FIXMEs" })
-- stylua: ignore end
