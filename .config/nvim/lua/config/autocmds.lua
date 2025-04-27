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
