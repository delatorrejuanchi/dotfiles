return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",

  cmd = "Mason",

  config = function(_, opts)
    require("mason").setup(opts)

    local mason_registry = require("mason-registry")

    local function ensure_installed()
      for _, name in ipairs(opts.ensure_installed or {}) do
        local package = mason_registry.get_package(name)
        if not package:is_installed() then
          package:install()
        end
      end
    end

    if mason_registry.refresh then
      mason_registry.refresh(ensure_installed)
    else
      ensure_installed()
    end
  end,
}
