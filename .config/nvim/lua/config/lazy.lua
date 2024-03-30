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
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function(_, opts)
      require("tokyonight").setup(opts)

      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  { import = "plugins" },

  { import = "plugins.lang.c" },
  { import = "plugins.lang.lua" },
  { import = "plugins.lang.haskell" },
  { import = "plugins.lang.go" },
  { import = "plugins.lang.json" },
  { import = "plugins.lang.markdown" },
  { import = "plugins.lang.php" },
  { import = "plugins.lang.yaml" },

  { import = "plugins.extras.testing" },
  { import = "plugins.extras.transparency" },
}

require("lazy").setup(spec, {
  defaults = {
    lazy = true,
    version = false,
  },
  install = {
    colorscheme = { "tokyonight" },
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
})
