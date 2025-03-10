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
    if vim.b[event.buf].jumped_to_last_location then
      return
    end

    vim.b[event.buf].jumped_to_last_location = true

    local last_location = vim.api.nvim_buf_get_mark(event.buf, '"')
    if last_location[1] > 0 and last_location[1] <= vim.api.nvim_buf_line_count(event.buf) then
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

    local line = vim.api.nvim_win_get_cursor(0)[1]
    if line ~= vim.b[event.buf].previous_line then
      vim.cmd("norm! zz")
      vim.b[event.buf].previous_line = line

      if vim.fn.mode() == "i" then
        local column = vim.fn.getcurpos()[5]

        vim.fn.cursor({ line, column })
      end
    end
  end,
})

-- check if we need to reload the file
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave", "CursorHold", "CursorHoldI" }, {
  callback = function(event)
    if vim.o.buftype ~= "" then
      vim.cmd(event.buf .. "checktime")
    end
  end,
})
