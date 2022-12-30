local buf, win

local M = {}

-- Create and open the floating window
local function floating_window()
	buf = vim.api.nvim_create_buf(false, true)

	local width = 100
	local height = 1000

	local ui = vim.api.nvim_list_uis()[1]

	local opts = {
		relative = "editor",
		width = width,
		height = height,
		row = (ui.height/2) - (height/2),
		col = (ui.width/2) - (width/2),
		border = "rounded",
		focusable = true,
		style = 'minimal'

	}
	win = vim.api.nvim_open_win(buf, true, opts)
	vim.api.nvim_win_set_option(win, "cursorline", true)
end

-- Set view options for buffer
local function view_buffer()
	vim.api.nvim_buf_set_option(buf, "modifiable", true)
	-- Ensure that the buftype is "help" so the subsequent helpfile is opened in the floating window
	vim.api.nvim_buf_set_option(buf, "buftype", "help")
end

-- Execute the help function to open in the current help buffer
local function run_help(term)
	local ok, _ = pcall(vim.api.nvim_command, "help " .. term)
	return ok
end

-- Lookup a help term and display in a floating window
M.lookup = function(term)
	floating_window()
	view_buffer()
	local ok = run_help(term)
	if not ok then
		vim.api.nvim_win_close(win, false)
		print("No helpfile found for " .. "\"" .. term .. "\"")
	end
end

-- Initialize YupHelp; register YupHelp cmd
M.setup = function()
	vim.api.nvim_create_user_command("YupHelp", function()
		vim.ui.input({
			prompt = "Get help for > ",
			default = "",
			completion = "help",
			highlight = function(input)
				if string.len(input) > 8 then
					return { { 0, 8, "InputHighlight" } }
				else
					return {}
				end
			end,
		}, function(term)
			vim.api.nvim_command('redraw')
			if term then
				M.lookup(term)
			else
				print "No help term provided."
			end
		end)
	end, {})
end

return M

