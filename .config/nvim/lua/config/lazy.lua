local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local spec = {
  { import = "plugins" },
  { import = "plugins.lang" },
  { import = "plugins.extras" },
}

require("lazy").setup(spec, {
  defaults = {
    lazy = true,
    version = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrw",
        "netrwPlugin",
        "rplugin",
        "tar",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zip",
        "zipPlugin",
      },
    },
  },
  change_detection = { notify = false },
  ui = {
    size = { width = 1, height = 1 },
  },
})
