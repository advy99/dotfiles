require("gitsigns").setup({
	current_line_blame = true,
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol",
		delay = 500,
		ignore_whitespace = false,
	},
	signs = {
		add          = { hl = "String", text = "▌ ", numhl="String", linehl="String" },
		change       = { hl = "Type",   text = "▌ ", numhl="Type",   linehl="Type" },
		changedelete = { hl = "Type",   text = "⯈ ", numhl="Type",   linehl="Type" },
		delete       = { hl = "Error",  text = "⯆ ", numhl="Error",  linehl="Error" },
		topdelete    = { hl = "Error",  text = "⯅ ", numhl="Error",  linehl="Error" },
	},
})
