local ns = vim.api.nvim_create_namespace("tabi")
local enabled = true

local function is_on_tab(cursor)
	local line = vim.api.nvim_get_current_line()
	return line:sub(cursor[2] + 1, cursor[2] + 1) == "\t"
end

local function show_indent(cursor)
  vim.api.nvim_buf_add_highlight(
		0,
		ns,
		"TabiIndent",
		tonumber(cursor[1] - 1),
		tonumber(cursor[2]),
		tonumber(cursor[2] + 1)
	)
end

local function hide_indent()
  vim.api.nvim_buf_clear_namespace(0, ns, 1, -1)
end

Tabi = {
  cursor_moved = function()
    local cursor = vim.api.nvim_win_get_cursor(0)
    hide_indent()
    if is_on_tab(cursor) then
      show_indent(cursor)
    end
  end;
  enable = function()
    enabled = true
    Tabi.cursor_moved()
  end;
  disable = function()
    enabled = false
    hide_indent()
  end;
  toggle = function()
    if enabled then Tabi.disable()
    else Tabi.enable() end
  end;
}

vim.cmd [[autocmd CursorMoved * lua Tabi.cursor_moved()]]
vim.cmd [[autocmd InsertEnter * lua Tabi.disable()]]
vim.cmd [[autocmd InsertLeave * lua Tabi.enable()]]
