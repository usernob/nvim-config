local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options

	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		dependencies = {
			-- format & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
			{
				"williamboman/mason.nvim",
				config = function(_, opts)
					dofile(vim.g.base46_cache .. "mason")
					require("mason").setup(opts)
					vim.api.nvim_create_user_command("MasonInstallAll", function()
						vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
					end, {})
					require("custom.configs.lspconfig") -- Load in lsp config
				end,
			},
			"williamboman/mason-lspconfig.nvim",
		},
		config = function() end, -- Override to setup mason-lspconfig
	},

	-- overrde plugin configs
	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
		init = function()
			require("core.utils").lazy_load("nvim-treesitter")
			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			parser_config.blade = {
				install_info = {
					url = "https://github.com/EmranMR/tree-sitter-blade",
					files = { "src/parser.c" },
					branch = "main",
				},
        filetype = "blade",
			}
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		opts = overrides.blankline,
	},
	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},
	{
		"Exafunction/codeium.vim",
		event = "BufEnter",
		init = function()
			-- Change '<C-g>' here to any keycode you like.
			vim.keymap.set("i", "<C-g>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true })
			vim.keymap.set("i", "<C-d>", function()
				return vim.fn["codeium#CycleCompletions"](1)
			end, { expr = true })
			vim.keymap.set("i", "<C-f>", function()
				return vim.fn["codeium#CycleCompletions"](-1)
			end, { expr = true })
			vim.keymap.set("i", "<M-w>", function()
				return vim.fn["codeium#Clear"]()
			end, { expr = true })
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
			{
				"luukvbaal/statuscol.nvim",
				config = function()
					local builtin = require("statuscol.builtin")
					require("statuscol").setup({
						relculright = true,
						ft_ignore = { "NvimTree", "nvdash", "nvcheatsheet" },
						bt_ignore = { "nofile" },
						segments = {
							{
								text = { "%s" },
								click = "v:lua.ScSa",
							},
							{
								text = { builtin.foldfunc, " " },
								click = "v:lua.ScFa",
							},
							{ text = { builtin.lnumfunc, "   " }, click = "v:lua.ScLa" },
						},
					})
				end,
			},
		},
		event = "BufEnter",
		config = function()
			require("custom.configs.ufo")
		end,
	},
	{
		"SmiteshP/nvim-navic",
		-- event = "VeryLazy",
		init = function()
			vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
		end,
		config = function()
			require("custom.configs.navic")
		end,
	},
	-- To make a plugin not be loaded
	-- {
	--   "NvChad/nvim-colorizer.lua",
	--   enabled = false
	-- },

	-- Uncomment if you want to re-enable which-key
	-- {
	--   "folke/which-key.nvim",
	--   enabled = true,
	-- },
}

return plugins
