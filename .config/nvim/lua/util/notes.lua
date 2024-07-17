local vault = os.getenv("OBSIDIAN_VAULT") or vim.fn.expand("~/obsidian/personal")

---@class util.notes
---@field vault string
local M = {
  vault = vault,
  inbox = vault .. "/inbox",
}

---@param metadata Metadata
local function build_frontmatter(metadata)
  local frontmatter = {}

  table.insert(frontmatter, "---")

  for key, value in pairs(metadata) do
    if type(value) == "table" then
      table.insert(frontmatter, key .. ":")

      for _, v in ipairs(value) do
        table.insert(frontmatter, "  - " .. v)
      end
    else
      table.insert(frontmatter, key .. ": " .. value)
    end
  end

  table.insert(frontmatter, "---")

  return frontmatter
end

---@param title string
local function build_header(title)
  return "# " .. title
end

function M.find()
  require("telescope.builtin").find_files({ prompt_title = "Find Notes", cwd = M.vault })
end

function M.live_grep()
  require("telescope.builtin").live_grep({ prompt_title = "Search Notes", cwd = M.vault })
end

function M.quick_note()
  if vim.fn.isdirectory(M.inbox) == 0 then
    vim.fn.mkdir(M.inbox, "p")
  end

  local name = vim.fn.input("Quick Note:")
  if name == "" then
    return
  end

  M.create_note(M.inbox, name)
end

---@param name string
---@param time integer
---@return string
function M.build_note_id(name, time)
  return time .. "-" .. name:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
end

---@param name string
---@return string
function M.build_title(name)
  local title = name:gsub("(%a)([%w_']*)", function(first, rest)
    return first:upper() .. rest
  end)

  return title
end

---@class Metadata
---@field id string
---@field aliases string[]
---@field created_at string

---@param id string
---@param title string
---@param time integer
---@return Metadata
function M.build_metadata(id, title, time)
  return {
    id = id,
    aliases = { title },
    created_at = os.date("!%Y-%m-%dT%H:%M:%SZ", time),
  }
end

---@param dir string
---@param name string
function M.create_note(dir, name)
  if vim.fn.isdirectory(dir) == 0 then
    vim.fn.mkdir(dir, "p")
  end

  local time = os.time()
  local id = M.build_note_id(name, time)
  local title = M.build_title(name)
  local metadata = M.build_metadata(id, title, time)

  vim.cmd("edit " .. dir .. "/" .. id .. ".md")

  vim.fn.append(0, vim.iter({ build_frontmatter(metadata), "", build_header(title), "" }):flatten():totable())
end

return M
