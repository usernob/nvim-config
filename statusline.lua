local sep_l = "█"
local sep_r = "%#St_sep_r#".. "█" .. " %#St_EmptySpace#"
local function gen_block(icon, txt, sep_l_hlgroup, iconHl_group, txt_hl_group)
  return sep_l_hlgroup .. sep_l .. iconHl_group .. icon .. " " .. txt_hl_group .. " " .. txt .. sep_r
end

local statusline = function(modules)
	-- local st_modules = require("nvchad_ui.statusline.vscode_colored")
	local tabstyle = function()
		local bufnr = vim.api.nvim_get_current_buf()
		local expandtab_value = vim.api.nvim_buf_get_option(bufnr, "expandtab")
		local tabstop = vim.api.nvim_buf_get_option(bufnr, "tabstop")
		local shiftwidth = vim.api.nvim_buf_get_option(bufnr, "shiftwidth")
		local indent_type = expandtab_value and "space" or "tab"
		local val = tabstop == shiftwidth and tabstop or shiftwidth .. " " .. tabstop
		return "%#StText#" .. indent_type .. " " .. val .. " "
	end
	local codeium = function()
		local status = vim.call("codeium#GetStatusString")
		local icon = "󰚩"
		if status == "OFF" then
			icon = "󱚧"
		end
		return gen_block(icon, status, "%#St_Codeium_sep#", "%#St_Codeium_bg#", "%#St_Codeium_txt#")
	end
	table.insert(modules, 9, tabstyle())
	table.insert(modules, 10, codeium())
	-- return {
	-- 	right = right_modules,
	-- 	-- st_modules.gitchanges(),
	-- 	-- vim.o.columns > 140 and "%#StText# Ln %l, Col %c  " or "",
	-- 	-- string.upper(vim.bo.fileencoding) == "" and ""
	-- 	-- or "%#St_encode#" .. string.upper(vim.bo.fileencoding) .. "  ",
	-- 	-- st_modules.filetype(),
	-- 	--   st_modules.LSP_Diagnostics(),
	-- 	--   tabstyle(),
	-- 	--   codeium(),
	-- 	--   st_modules.LSP_status() or "",
	-- 	--   st_modules.cwd(),
	-- 	--   st_modules.cursor_position(),
	-- 	-- }
	-- }
end

return statusline
