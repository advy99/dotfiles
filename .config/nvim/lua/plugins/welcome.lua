local welcome = require("welcome")
local mod = require("welcome.modules")


welcome.setup({
	modules = {
		mod.separator.new("="),
		mod.separator.new("-"),
	},
	options = {
		colorcolumn = "40",
	},
})
