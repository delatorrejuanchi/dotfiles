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
  { import = "plugins.lang" },
  { import = "plugins.extras" },
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
