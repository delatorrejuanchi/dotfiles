local vault = os.getenv("OBSIDIAN_VAULT") or vim.fn.expand("~/obsidian/main")

---@class util.notes
---@field vault string
---@field inbox string
---@field projects string
---@field areas string
---@field resources string
---@field archive string
---@field journal string
local M = {
  vault = vault,
  inbox = vault .. "/inbox",
  projects = vault .. "/projects",
  areas = vault .. "/areas",
  resources = vault .. "/resources",
  archive = vault .. "/archive",
  journal = vault .. "/journal",
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

function M.today()
  local name = os.date("%Y-%m-%d") --[[@as string]]

  M.create_note(M.journal, name)
end

function M.scratchpad()
  M.create_note(M.vault, "scratchpad")
end

function M.new()
  local name = vim.fn.input("New Note:")
  if name == "" then
    return
  end

  M.create_note(M.inbox, name, os.time())
end

local function move_note(dir)
  assert(vim.fn.resolve(vim.fn.expand("%:p:h")) == vim.fn.resolve(M.inbox), "note is not in the inbox")

  if vim.fn.isdirectory(dir) == 0 then
    vim.fn.mkdir(dir, "p")
  end

  vim.cmd("saveas " .. dir .. "/" .. vim.fn.expand("%:t"))
  vim.cmd("silent !rm " .. M.inbox .. "/" .. vim.fn.expand("%:t"))
  vim.cmd("bwipeout! #")
end

function M.move_to_projects()
  move_note(M.projects)
end

function M.move_to_areas()
  move_note(M.areas)
end

function M.move_to_resources()
  move_note(M.resources)
end

function M.move_to_archive()
  move_note(M.archive)
end

---@param name string
---@param time integer?
---@return string
function M.build_note_id(name, time)
  local id = name:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
  if time then
    id = time .. "-" .. id
  end

  return id
end

---@param name string
---@return string
function M.build_title(name)
  return name
end

---@class Metadata
---@field id string
---@field aliases string[]
---@field created_at string

---@param id string
---@param title string
---@param time integer?
---@return Metadata
function M.build_metadata(id, title, time)
  return {
    id = id,
    aliases = { title },
    created_at = os.date("%Y-%m-%dT%H:%M:%SZ", time),
  }
end

---@param dir string
---@param name string
---@param time integer?
function M.create_note(dir, name, time)
  if vim.fn.isdirectory(dir) == 0 then
    vim.fn.mkdir(dir, "p")
  end

  local id = M.build_note_id(name, time)
  local title = M.build_title(name)
  local metadata = M.build_metadata(id, title, time)

  local path = dir .. "/" .. id .. ".md"

  vim.cmd("edit " .. path)

  if vim.fn.filereadable(path) == 0 then
    vim.fn.append(0, vim.iter({ build_frontmatter(metadata), "", build_header(title), "" }):flatten():totable())
  end
end

return M
