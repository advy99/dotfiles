require("nvim-tree").setup({
	hijack_cursor = true,
	open_on_tab = true,
	sort_by = "extension",
	view = {
		width = 30,
	},
	renderer = {
		icons = {
			git_placement = "signcolumn",
			glyphs = {
				git = {
					unstaged =     " ",
					staged =       "🞥 ",
					unmerged =     " ",
					renamed =      " ",
					untracked =    " ",
					deleted =      " ",
				},
			},
		},
	},
})
