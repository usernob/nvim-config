local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

local navic = require("nvim-navic")
-- List of servers to install
local servers = { "html", "cssls", "tsserver", "clangd" }

require("mason-lspconfig").setup({
	ensure_installed = servers,
})

-- This will setup lsp for servers you listed above
-- And servers you install through mason UI
-- So defining servers in the list above is optional
require("mason-lspconfig").setup_handlers({
	-- Default setup for all servers, unless a custom one is defined below
	function(server_name)
		lspconfig[server_name].setup({
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
				-- Add your other things here
				-- Example being format on save or something
				if client.server_capabilities.documentSymbolProvider then
					navic.attach(client, bufnr)
				end
			end,
			capabilities = capabilities,
		})
	end,
	-- custom setup for a server goes after the function above
	-- Example, override lua_ls
	["lua_ls"] = function()
		lspconfig["lua_ls"].setup({
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
				if client.server_capabilities.documentSymbolProvider then
					navic.attach(client, bufnr)
				end
			end,
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
							[vim.fn.stdpath("data") .. "/lazy/extensions/nvchad_types"] = true,
							[vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
						},
						maxPreload = 100000,
						preloadFileSize = 10000,
					},
				},
			},
		})
	end,

	["emmet_ls"] = function()
		lspconfig["emmet_ls"].setup({
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
				-- Add your other things here
				-- Example being format on save or something
				if client.server_capabilities.documentSymbolProvider then
					navic.attach(client, bufnr)
				end
			end,
      filetypes = { "astro", "css", "eruby", "html", "htmldjango", "javascriptreact", "less", "pug", "sass", "scss", "svelte", "typescriptreact", "vue" , "php"},
			capabilities = capabilities,
		})
	end,
	-- ["denols"] = function()
	-- end,
	["tsserver"] = function()
		lspconfig["tsserver"].setup({
			on_attach = on_attach,
			root_dir = lspconfig.util.root_pattern("package.json"),
			single_file_support = false,
		})
	end,
	-- Example: disable auto configuring an LSP
	["clangd"] = function()
		lspconfig["clangd"].setup({
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
				if client.server_capabilities.documentSymbolProvider then
					navic.attach(client, bufnr)
				end
			end,
			capabilities = capabilities,
			cmd = { "clangd", "--background-index", "--clang-tidy", "--offset-encoding=utf-16" },
		})
	end,
})

-- non masom binary setup
lspconfig["denols"].setup({
	on_attach = on_attach,
	root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
})
