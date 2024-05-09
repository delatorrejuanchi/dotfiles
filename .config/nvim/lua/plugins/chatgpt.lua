return {
  "jackMort/ChatGPT.nvim",

  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "folke/trouble.nvim",
    "nvim-telescope/telescope.nvim",
  },

  cmd = {
    "ChatGPT",
    "ChatGPTActAs",
    "ChatGPTCompleteCode",
    "ChatGPTEditWithInstructions",
    "ChatGPTRun",
  },

  opts = {
    openai_params = {
      model = "gpt-4-turbo",
    },
    openai_edit_params = {
      model = "gpt-4-turbo",
    },
  },
}
