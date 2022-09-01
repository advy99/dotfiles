local hydra = require("hydra")

hydra({
	name = "Side scroll",
	mode = "n",
	body = "z",
	heads = {
		{ "h", "5zh" },
		{ "l", "5zl", { desc = "<-/->" } },
		{ "H", "zH" },
		{ "L", "zL", { desc = "half screen <-/->" } },
	},
})
