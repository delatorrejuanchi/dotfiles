return {
  "mfussenegger/nvim-lint",

  event = "BufReadPre",

  config = function(_, opts)
    local lint = require("lint")

    lint.linters_by_ft = opts.linters_by_ft or {}

    local function try_lint()
      local names = lint._resolve_linter_by_ft(vim.bo.filetype)

      names = vim.tbl_filter(function(name)
        return lint.linters[name] ~= nil
      end, names)

      if #names > 0 then
        lint.try_lint(names)
      end
    end

    vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
      callback = util.debounce(100, try_lint),
    })
  end,
}
