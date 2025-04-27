-- lazy
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "Lazy" })

-- better up/down
vim.keymap.set({ "n", "x" }, "<Up>", "v:count? 'k' : 'gk'", { expr = true, desc = "up" })
vim.keymap.set({ "n", "x" }, "<Down>", "v:count? 'j' : 'gj'", { expr = true, desc = "down" })

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- move lines up/down
vim.keymap.set("n", "<A-Down>", "<cmd>execute 'move .+' . v:count1<CR>==", { desc = "move line down" })
vim.keymap.set("i", "<A-Down>", "<esc><cmd>m .+1<CR>==gi", { desc = "move line down" })
vim.keymap.set("v", "<A-Down>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<CR>gv=gv", { desc = "move line down" })
vim.keymap.set("n", "<A-Up>", "<cmd>execute 'move .-' . (v:count1 + 1)<CR>==", { desc = "move line up" })
vim.keymap.set("i", "<A-Up>", "<esc><cmd>m .-2<CR>==gi", { desc = "move line up" })
vim.keymap.set("v", "<A-Up>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<CR>gv=gv", { desc = "move line up" })

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

-- quickfix
vim.keymap.set("n", "<leader>cd", vim.diagnostic.setqflist, { desc = "diagnostics" })
vim.keymap.set("n", "<leader>ct", util.find_todos, { desc = "find TODOs" })
vim.keymap.set("n", "<leader>cf", util.find_fixmes, { desc = "find FIXMEs" })
