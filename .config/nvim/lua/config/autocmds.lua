local general = vim.api.nvim_create_augroup("general", { clear = true })

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
  group = general,
  desc = "Disable comment continuation",
})
