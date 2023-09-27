local prefix = "<leader>o"
local vault = vim.fn.expand("~") .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/main"

-- disable obsidian.nvim if not on MacOS
if not vim.fn.has("macunix") then
  return {}
end

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
      { prefix .. "f", "<cmd>ObsidianQuickSwitch<CR>", desc = "Quick Switch" },
      { prefix .. "t", "<cmd>ObsidianToday<CR>", desc = "Today" },
      { prefix .. "n", "<cmd>ObsidianNew<CR>", desc = "New note" },
    },

    opts = {
      dir = vault,
      daily_notes = {
        folder = "journal",
      },

      use_advanced_uri = true,
      overwrite_mappings = true,

      completion = {
        new_notes_location = "notes_subdir",
      },

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
        if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
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
    },
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        [prefix] = { name = "+obsidian" },
      },
    },
  },
}
