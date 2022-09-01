local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
	sync_install = true,
	auto_install = true,

	highlight = {
		enable  = true,
		disable = {"bash", "help", "latex", "vim"},
	}
})


treesitter.setup({
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = { -- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
	},
})
