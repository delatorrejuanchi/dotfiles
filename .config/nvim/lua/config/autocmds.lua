-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- do not insert a comment leader after o or O in normal mode
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.cmd("set fo-=o")
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "help", "lspinfo", "qf", "checkhealth" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- jump to last location when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function(event)
    local buf = event.buf
    if vim.tbl_contains({ "gitcommit" }, vim.bo[buf].filetype) or vim.b[buf].jumped_to_last_location then
      return
    end

    vim.b[buf].jumped_to_last_location = true

    local last_location = vim.api.nvim_buf_get_mark(buf, '"')
    if last_location[1] > 0 and last_location[1] <= vim.api.nvim_buf_line_count(buf) then
      pcall(vim.api.nvim_win_set_cursor, 0, last_location)
    end
  end,
})

-- stay centered
vim.api.nvim_create_autocmd({ "BufReadPost", "CursorMoved", "CursorMovedI" }, {
  callback = function(event)
    if not util.ui.should_stay_centered() then
      return
    end

    local buf = event.buf

    local line = vim.api.nvim_win_get_cursor(0)[1]
    if line ~= vim.b[buf].previous_line then
      vim.cmd("norm! zz")
      vim.b[buf].previous_line = line

      if vim.fn.mode() == "i" then
        local column = vim.fn.getcurpos()[5]

        vim.fn.cursor({ line, column })
      end
    end
  end,
})

-- check if we need to reload the file
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave", "CursorHold", "CursorHoldI" }, {
  callback = function()
    if vim.o.buftype ~= "" then
      vim.cmd("checktime")
    end
  end,
})

-- open autocomplete automatically when typing
vim.api.nvim_create_autocmd("InsertCharPre", {
  callback = function()
    if vim.fn.pumvisible() == 1 or vim.fn.state("m") == "m" or vim.o.buftype ~= "" then
      return
    end

    local key = vim.keycode("<C-x><C-o>")
    vim.api.nvim_feedkeys(key, "m", false)
  end,
})
