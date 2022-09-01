local augroup = vim.api.nvim_create_augroup("AU_filetypes_by_extension", {})


local filetypes = {
	cpp  = "*.tpp",
	glsl = { "*.comp", "*.frag", "*.fs", "*.geom", "*.tesc", "*.tese", "*.vert", "*.vs" },
	tex  = "*.tikz",
}


for filetype, extensions in pairs(filetypes) do
	vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
		pattern = extensions,
		command = "set filetype="..filetype,
		group   = augroup,
	})
end
