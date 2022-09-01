require("diffview").setup({
	file_panel = {
		win_config = {
			position = "bottom",
			height = 10,
		},
	},
	key_bindings = {
		disable_defaults = false,
		file_panel = {
			['q'] = "<cmd>DiffviewClose<cr>",
		},
		option_panel = {
			['q'] = "<cmd>DiffviewClose<cr>",
		},
		view = {
			['q'] = "<cmd>DiffviewClose<cr>",
		},
	},
})
