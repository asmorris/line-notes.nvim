local M = {}

function M.setup(opts)
	-- Initialize configuration
	local config = require("line_notes.config").setup(opts)

	-- Load notes
	require("line_notes.notes").load_notes()

	-- Set up keymaps using configuration
	local keymaps = config.keymaps

	vim.api.nvim_set_keymap(
		"n",
		keymaps.add_note,
		":lua require('line_notes.notes').add_note()<CR>",
		{ noremap = true, silent = true }
	)

	vim.api.nvim_set_keymap(
		"n",
		keymaps.list_notes,
		":lua require('line_notes.telescope_picker').open_notes_picker()<CR>",
		{ noremap = true, silent = true }
	)

	vim.api.nvim_set_keymap(
		"n",
		keymaps.delete_note,
		":lua require('line_notes.notes').delete_note()<CR>",
		{ noremap = true, silent = true }
	)

	vim.api.nvim_set_keymap(
		"n",
		keymaps.show_note,
		":lua require('line_notes.notes').show_note()<CR>",
		{ noremap = true, silent = true }
	)
end

return M
