local M = {}

-- Default configuration
M.defaults = {
	keymaps = {
		add_note = "<leader>an",
		list_notes = "<leader>ln",
		delete_note = "<leader>dn",
		show_note = "<leader>sn",
	},
	signs = {
		note_icon = "🗒️",
		highlight = "Comment",
		number_highlight = "",
	},
}

-- Store the user's configuration
M.options = {}

-- Initialize configuration with user options
function M.setup(opts)
	-- Merge user options with defaults
	M.options = vim.tbl_deep_extend("force", {}, M.defaults, opts or {})

	-- Validate configuration
	M.validate()

	return M.options
end

-- Get current configuration
function M.get()
	return M.options
end

-- Validate configuration values
function M.validate()
	-- Add any validation logic here if needed
	if type(M.options.keymaps) ~= "table" then
		error("keymaps configuration must be a table")
	end

	-- Ensure all required keymap fields exist
	local required_keymaps = { "add_note", "list_notes", "delete_note", "show_note" }
	for _, keymap in ipairs(required_keymaps) do
		if not M.options.keymaps[keymap] then
			M.options.keymaps[keymap] = M.defaults.keymaps[keymap]
		end
	end
end

return M
