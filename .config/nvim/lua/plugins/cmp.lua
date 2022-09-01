local cmp = require("cmp")

cmp.setup({
	formatting = {
		format = function (_, vim_item)
			vim_item.kind = require("lspkind").presets.default[vim_item.kind].." " ..vim_item.kind
			vim_item.abbr = string.sub(vim_item.abbr, 1, 65)
			return vim_item
		end
	},
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4),  {"i", "c"}),
		["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
		["<CR>"] = function ()
			vim.api.nvim_feedkeys("\n", "i", true)
			cmp.mapping.close()
		end,
		["<Tab>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
	}),
	-- snippet = {expand = function (args) vim.fn["UltiSnips#Anon"](args.body) end},
	snippet = { expand = function (args) require("luasnip").lsp_expand(args.body) end },
	sources = {
		{ name = "path" },
		{ name = "luasnip" },
		-- {name = "ultisnips"},
		{ name = "nvim_lsp" },
		{ name = "latex_symbols" },
		{ name = "treesitter" },
		{ name = "buffer" },
	},
	view = {entries = native},
})


cmp.setup.cmdline(":", {
	sources = {
		{name = "cmdline", group_index = 1},
		{name = "cmdline_history", group_index = 2}
	},
	mapping = cmp.mapping.preset.cmdline({}),
	view = {entries = native},
})


cmp.setup.cmdline("/", {
	sources = {
		{name = "buffer"}
	},
	mapping = cmp.mapping.preset.cmdline({}),
	view = {entries = native},
})
