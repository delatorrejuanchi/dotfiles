return {
  "neovim/nvim-lspconfig",
  optional = true,

  opts = {
    servers = {
      clangd = {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
        },
      },
    },
  },
}
