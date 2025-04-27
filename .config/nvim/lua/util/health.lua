---@class util.health
local M = {}

function M.check()
  vim.health.start("config")

  for _, cmd in ipairs({ "git", "rg", { "fd", "fdfind" }, "lazygit", "make", "fzf" }) do
    local name = type(cmd) == "string" and cmd or vim.inspect(cmd)
    local commands = type(cmd) == "string" and { cmd } or cmd
    ---@cast commands string[]

    for _, command in ipairs(commands) do
      if vim.fn.executable(command) == 1 then
        vim.health.ok(("`%s` is installed"):format(name))

        goto continue
      end
    end

    vim.health.warn(("`%s` is not installed"):format(name))

    ::continue::
  end
end

return M
