local present, null_ls = pcall(require, "null-ls")

if not present then
	return
end

local b = null_ls.builtins

local sources = {

	-- webdev stuff
	-- b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
	b.formatting.prettier.with({ filetypes = { "html", "markdown", "css", "javascript", "typescript" } }), -- so prettier works only on these filetypes
	b.formatting.blade_formatter.with({ filetypes = { "blade", "php", "php.html" } }),
	b.formatting.phpcsfixer,
	b.formatting.rustfmt,
	-- Lua
	b.formatting.stylua,

	-- cpp
	b.formatting.clang_format, --.with({ extra_args = { "-style=file" } }),
}

null_ls.setup({
	debug = true,
	sources = sources,
})
