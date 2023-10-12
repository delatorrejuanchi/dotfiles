return {
  "nvim-neo-tree/neo-tree.nvim",

  opts = {
    close_if_last_window = true,
    default_component_configs = {
      file_size = { enabled = false },
      type = { enabled = false },
      last_modified = { enabled = false },
      created = { enabled = false },
    },
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        never_show = { ".DS_Store", "node_modules", ".git" },
      },
    },
  },
}
