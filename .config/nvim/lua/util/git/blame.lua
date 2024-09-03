---@class util.git.blame
local M = {}

---@class GitBlameInfo
---@field sha string
---@field original_line_number integer
---@field final_line_number integer
---@field line_count integer?
---@field author string
---@field author_mail string
---@field author_time integer
---@field author_tz string
---@field committer string
---@field committer_mail string
---@field committer_time integer
---@field committer_tz string
---@field summary string
---@field previous_sha string?
---@field previous_filename string?
---@field boundary boolean?
---@field filename string
---@field line string

---@param line string
local function parse_porcelain_line(line)
  if line:match("^%x+%s%d+%s%d+") then
    local sha, original_line, final_line, line_count = line:match("^(%x+)%s(%d+)%s(%d+)%s?(%d*)$")

    return {
      sha = sha,
      original_line_number = tonumber(original_line),
      final_line_number = tonumber(final_line),
      line_count = tonumber(line_count) or nil,
    }
  end

  local key, value = line:match("^([%w%-]+)%s(.+)$")
  if key == "author-time" or key == "committer-time" then
    return {
      [key:gsub("-", "_")] = tonumber(value),
    }
  elseif key == "previous" then
    local previous_sha, previous_filename = value:match("^(%x+)%s(%S+)$")

    return {
      previous_sha = previous_sha,
      previous_filename = previous_filename,
    }
  elseif key == "boundary" then
    return {
      boundary = true,
    }
  elseif
    vim.tbl_contains({
      "author",
      "author-mail",
      "author-tz",
      "committer",
      "committer-mail",
      "committer-tz",
      "summary",
      "filename",
    }, key)
  then
    return {
      [key:gsub("-", "_")] = value,
    }
  end

  return nil
end

---@param lines string[]
---@return GitBlameInfo[]
local function parse_porcelain_lines(lines)
  local blames = {}
  local current_blame = nil

  for _, line in ipairs(lines) do
    local parsed_line = parse_porcelain_line(line)
    if not parsed_line then
      if current_blame then
        if not current_blame.line then
          current_blame.line = line
        end

        table.insert(blames, current_blame)

        current_blame = nil
      end

      goto continue
    end

    if not current_blame then
      current_blame = parsed_line
      goto continue
    end

    local parsed_keys = vim.tbl_keys(parsed_line)

    for _, key in ipairs(parsed_keys) do
      if current_blame[key] then
        current_blame.line = line

        table.insert(blames, current_blame)

        current_blame = nil

        goto continue
      end
    end

    current_blame = vim.tbl_extend("force", current_blame, parsed_line)

    ::continue::
  end

  return blames
end

---@param file string
---@param commit string?
---@return GitBlameInfo[]
local function blame(file, commit)
  local args = {
    "git",
    "--no-pager",
    "blame",
    "--line-porcelain",
    file,
  }

  if commit then
    table.insert(args, commit)
  end

  local result = vim.system(args):wait()

  if result.code ~= 0 then
    error(result.stderr)
  end

  return parse_porcelain_lines(vim.split(result.stdout, "\n"))
end

function M:toggle()
  if vim.b.git_blame_win then
    vim.api.nvim_win_close(vim.b.git_blame_win, true)
    vim.b.git_blame_win = nil

    return
  end

  local blame_infos = blame(vim.fn.expand("%"))

  local buf = vim.api.nvim_create_buf(false, true)

  -- TODO: set other options (e.g.: width, title, etc.)
  local win = vim.api.nvim_open_win(buf, false, {
    vertical = true,
    split = "left",
    style = "minimal",
  })

  vim.b.git_blame_win = win

  -- TODO: change highlights
  -- TODO: show more useful information
  local lines = {}
  for _, blame_info in ipairs(blame_infos) do
    table.insert(lines, string.format("%s %s", blame_info.author, blame_info.summary))
  end

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].buftype = "nofile"
  vim.bo[buf].swapfile = false
  vim.bo[buf].modifiable = false

  vim.wo[win].winfixwidth = true
  vim.wo[win].wrap = false
  vim.wo[win].cursorline = true

  local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
  vim.api.nvim_win_set_cursor(win, {row, 0})

  vim.wo.scrollbind = true
  vim.wo.cursorbind = true
  vim.wo[win].scrollbind = true
  vim.wo[win].cursorbind = true
end

return M
