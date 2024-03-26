return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "folke/noice.nvim" },

  event = "VeryLazy",

  init = function()
    vim.opt.statusline = " "
  end,

  opts = function()
    local branch = { "branch" }

    local filename = { "filename", path = 1, symbols = { modified = "", readonly = "", unnamed = "" } }

    local diagnostics = { "diagnostics" }

    local diff = { "diff", always_visible = true }

    local sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { branch, diff },
      lualine_x = { diagnostics, filename },
      lualine_y = {},
      lualine_z = {},
    }

    return {
      options = {
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },

      sections = sections,
      inactive_sections = sections,
    }
  end,
}
