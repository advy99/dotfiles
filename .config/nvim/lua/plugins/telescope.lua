local telescope = require("telescope")

telescope.setup({
	defaults = {
		borderchars = {" ", " ", " ", " ", " ", " ", " ", " "},
		layout_config = {prompt_position = "top"},
		prompt_prefix   = " ",
		selection_caret = "⯈ ",
		sorting_strategy = "ascending",
	},
	-- extensions = {
		-- ["ui-select"] = {require("telescope.themes").get_dropdown({})}
	-- }
})


-- telescope.load_extension("ui-select")
