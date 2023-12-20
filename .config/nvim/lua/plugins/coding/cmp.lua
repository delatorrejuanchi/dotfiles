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
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local cmp = require("cmp")
      local luasnip = require("luasnip")

      opts.mapping = {
        ["<Down>"] = { i = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }) },
        ["<Up>"] = { i = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }) },
        ["<CR>"] = { i = cmp.mapping.confirm({ select = false }) },
        ["<Tab>"] = cmp.mapping(function(fallback)
          if has_words_before() and cmp.visible() then
            cmp.confirm({ select = true })
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
      }

      opts.preselect = cmp.PreselectMode.None
      opts.completion.completeopt = "menu,menuone,noinsert,noselect"
      opts.experimental.ghost_text = false

      opts.window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }

      opts.completion.keyword_length = 2
    end,
  },
}
