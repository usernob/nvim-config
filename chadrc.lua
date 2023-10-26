---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require("custom.highlights")

M.ui = {
	theme_toggle = { "onedark", "one_light" },
	theme = "onedark",
	hl_override = highlights.override,
	hl_add = highlights.add,

	transparency = false,

	statusline = {
		theme = "minimal",
    -- overriden_modules = function (modules)
    --   modules[2] = (function ()
    --     return modules[2] .. "mode"
    --   end)()
    --   table.insert(modules, 3, "bruh")
    -- end,
		-- overriden_modules = function(st_modules)
		-- 	-- st_modules this is just default table of statusline modules
		-- 	return {
		-- 		mode = function()
		-- 			return st_modules.mode() .. " bruh "
		-- 			-- or just return "" to hide this module
		-- 		end,
		-- 	}
		-- end,
		-- user_modules = function(st_modules)
		--   local m = st_modules.left
		--   local foo = function ()
		--     return " barr "
		--   end
		--   table.insert(m, 1, foo)
		--   return {
		--     left = m,
		--   }
		-- end,
		overriden_modules = require("custom.statusline"),
	},

	tabufline = {
		show_numbers = true,
	},

	cmp = {
		icons = true,
		lspkind_text = true,
		style = "atom_colored", -- default/flat_light/flat_dark/atom/atom_colored
		border_color = "grey_fg", -- only applicable for "default" style, use color names from base30 variables
		selected_item_bg = "colored", -- colored / simple
	},
	nvdash = {
		load_on_startup = true,
	},
  telescope = {
    style = "borderless"
  }
}
M.plugins = "custom.plugins"
M.lazy_nvim = require("custom.configs.lazy_nvim")
-- check core.mappings for table structure
M.mappings = require("custom.mappings")

return M
