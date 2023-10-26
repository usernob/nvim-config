local present, navic = pcall(require, "nvim-navic")
if not present then
	return
end

local icons = require "nvchad.icons.lspkind"

navic.setup({
	icons = {
	    File          = icons.File .. " ",
	    Module        = icons.Module .. " ",
	    Namespace     = icons.Namespace .. " ",
	    Package       = icons.Package .. " ",
	    Class         = icons.Class .. " ",
	    Method        = icons.Method .. " ",
	    Property      = icons.Property .. " ",
	    Field         = icons.Field .. " ",
	    Constructor   = icons.Constructor .. " ",
	    Enum          = icons.Enum .. " ",
	    Interface     = icons.Interface .. " ",
	    Function      = icons.Function .. " ",
	    Variable      = icons.Variable .. " ",
	    Constant      = icons.Constant .. " ",
	    String        = icons.String .. " ",
	    Number        = icons.Number .. " ",
	    Boolean       = icons.Boolean .. " ",
	    Array         = icons.Array .. " ",
	    Object        = icons.Object .. " ",
	    Key           = icons.Keyword .. " ",
	    Null          = icons.Null .. " ",
	    EnumMember    = icons.EnumMember .. " ",
	    Struct        = icons.Struct .. " ",
	    Event         = icons.Event .. " ",
	    Operator      = icons.Operator .. " ",
	    TypeParameter = icons.TypeParameter .. " "
	},
	-- icons = {
	-- 	File = " ",
	-- 	Module = " ",
	-- 	Namespace = " ",
	-- 	Package = " ",
	-- 	Class = " ",
	-- 	Method = " ",
	-- 	Property = " ",
	-- 	Field = " ",
	-- 	Constructor = " ",
	-- 	Enum = " ",
	-- 	Interface = " ",
	-- 	Function = " ",
	-- 	Variable = " ",
	-- 	Constant = " ",
	-- 	String = " ",
	-- 	Number = " ",
	-- 	Boolean = " ",
	-- 	Array = " ",
	-- 	Object = " ",
	-- 	Key = " ",
	-- 	Null = " ",
	-- 	EnumMember = " ",
	-- 	Struct = " ",
	-- 	Event = " ",
	-- 	Operator = " ",
	-- 	TypeParameter = " ",
	-- },
	lsp = {
		auto_attach = false,
		preference = nil,
	},
	highlight = true,
	separator = "  ",
	depth_limit = 4,
	depth_limit_indicator = "..",
	safe_output = true,
	click = true
})
