return {
  {
    "L3MON4D3/LuaSnip",

    keys = function()
      return {}
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },

    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_non_whitespace_characters_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(1, col):match("%S") ~= nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end

          if has_non_whitespace_characters_before() and cmp.visible() then
            cmp.confirm({ select = true })
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      })

      opts.preselect = cmp.PreselectMode.None
      opts.completion.completeopt = "menu,menuone,noinsert,noselect"
    end,
  },
}
