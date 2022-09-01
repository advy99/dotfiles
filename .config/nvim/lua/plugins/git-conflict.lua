vim.cmd([[
highlight! GitConflictIncomingBase guibg=#474096
highlight! GitConflictCurrentBase guibg=#008569
]])


require("git-conflict").setup({
	default_mappings = false,
	disable_diagnostics = false,
	highlights = {
		current  = "GitConflictCurrentBase",
		incoming = "GitConflictIncomingBase",
	}
})
