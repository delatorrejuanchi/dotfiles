return {
  "nvim-lualine/lualine.nvim",

  opts = function()
    local icons = require("lazyvim.config").icons

    local diagnostics = {
      "diagnostics",
      symbols = {
        error = icons.diagnostics.Error,
        hint = icons.diagnostics.Hint,
        info = icons.diagnostics.Info,
        warn = icons.diagnostics.Warn,
      },
    }

    local diff = {
      "diff",
      symbols = {
        added = icons.git.added,
        modified = icons.git.modified,
        removed = icons.git.removed,
      },
      always_visible = true,
    }

    local filetype = { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } }

    local filename = { "filename", path = 1, symbols = { modified = "", readonly = "", unnamed = "" } }

    return {
      options = {
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { filetype, filename, diff, diagnostics },
        lualine_x = {
          {
            require("noice").api.status.mode["get"],
            cond = require("noice").api.status.mode["has"],
          },
        },
        lualine_y = {},
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { filetype, filename, diff, diagnostics },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    }
  end,
}
