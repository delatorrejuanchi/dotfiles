return {
  {
    "neovim/nvim-lspconfig",
    optional = true,

    opts = {
      servers = {
        clangd = {
          capabilities = {
            offsetEncoding = { "utf-16" },
          },
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
          },
        },
      },
    },
  },
}
