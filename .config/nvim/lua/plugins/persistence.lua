return {
  "folke/persistence.nvim",

  init = function()
    local function load()
      if vim.fn.argc(-1) > 0 then
        return
      end

      vim.schedule(function()
        require("persistence").load()
      end)
    end

    local lazy_view_win = nil

    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        local lazy_view = require("lazy.view")

        if lazy_view.visible() then
          lazy_view_win = lazy_view.view.win
        else
          load()
        end
      end,
    })

    vim.api.nvim_create_autocmd("WinClosed", {
      callback = function(event)
        if not lazy_view_win or event.match ~= tostring(lazy_view_win) then
          return
        end

        load()
      end,
    })
  end,

  opts = {},
}
