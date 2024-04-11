local prefix = "<leader>o"

local vault = vim.fn.expand("~") .. "/obsidian"

local workspace_personal = "personal"
local workspace_work = "work"

return {
  {
    "epwalsh/obsidian.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
    },

    event = {
      "BufReadPre " .. vault .. "/**.md",
      "BufNewFile " .. vault .. "/**.md",
    },

    keys = {
      { prefix .. "f", "<cmd>ObsidianQuickSwitch<CR>", desc = "Find" },
      { prefix .. "t", "<cmd>ObsidianToday<CR>", desc = "Today" },
      { prefix .. "n", "<cmd>ObsidianNew<CR>", desc = "New note" },

      {
        prefix .. "p",
        "<cmd>ObsidianWorkspace " .. workspace_personal .. "<CR>",
        desc = "switch to personal workspace",
      },
      {
        prefix .. "w",
        "<cmd>ObsidianWorkspace " .. workspace_work .. "<CR>",
        desc = "switch to work workspace",
      },
    },

    opts = {
      workspaces = {
        { name = workspace_personal, path = vault .. "/" .. workspace_personal, strict = true },
        { name = workspace_work, path = vault .. "/" .. workspace_work, strict = true },
      },

      daily_notes = { folder = "journal" },

      new_notes_location = "notes_subdir",

      open_notes_in = "vsplit",

      picker = { name = "telescope.nvim" },

      ui = { enable = false },

      note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local suffix = ""
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.time()) .. "-" .. suffix
      end,

      note_frontmatter_func = function(note)
        local now = os.date("%Y-%m-%d %H:%M")
        local out = { id = note.id, aliases = note.aliases, tags = note.tags }

        -- `note.metadata` contains any manually added fields in the frontmatter.
        -- So here we just make sure those fields are kept in the frontmatter.
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end

        if out.created_at == nil then
          out.created_at = now
        end
        out.updated_at = now

        return out
      end,

      log_level = vim.log.levels.WARN,
    },

    config = function(_, opts)
      local primary_workspace = workspace_personal

      if vim.fn.getcwd():find(vim.fn.expand("~") .. "/code", 1, true) or vim.fn.getcwd():find("/Volumes/code", 1, true) then
        primary_workspace = workspace_work
      end

      for i, workspace in ipairs(opts.workspaces) do
        if workspace.name == primary_workspace then
          local ws = table.remove(opts.workspaces, i)
          table.insert(opts.workspaces, 1, ws)
          break
        end
      end

      require("obsidian").setup(opts)
    end,
  },
}
