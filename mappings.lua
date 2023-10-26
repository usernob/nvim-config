---@type MappingsTable
local M = {}

M.general = {
	n = {
		-- ["d"] = { '"_d', opts = { noremap = true, silent = true } }, -- disable copy after accept completion
		[";"] = { ":", "enter command mode", opts = { nowait = true } },
		["<leader>cd"] = { "<CMD>cd %:p:h<CR>", "cd to current directory of this file" },
		["<leader>dn"] = {
			function()
				vim.diagnostic.goto_next()
			end,
			"diagnostic goto next",
		},
		["<leader>dp"] = {
			function()
				vim.diagnostic.goto_prev()
			end,
			"diagnostic goto prev",
		},
	},
  -- v = {
		-- ["d"] = { '"_d', opts = { noremap = true, silent = true } }, -- disable copy after accept completion
  -- }
}

-- more keybinds!

return M
