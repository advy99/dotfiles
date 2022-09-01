local luasnip = require("luasnip")

local luasnip_api = {
	add = luasnip.add_snippets,
	snip = luasnip.snippet,

	f = luasnip.function_node,
	i = luasnip.insert_node,
	t = luasnip.text_node,

	livecopy = function (text, _, _)
		return text[1][1]
	end
}


luasnip.setup({
	update_events = "TextChanged,TextChangedI",
})


local filetypes = {
	"c",
}


for _, filetype in pairs(filetypes) do
	require("plugins.luasnip.snippets."..filetype)(luasnip_api)
end
