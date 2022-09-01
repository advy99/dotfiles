local setup = {
	load = {
		["core.defaults"] = {},
		["core.norg.concealer"] = {},
		["core.norg.dirman"] = { config = {
			default_workspace = "root",
			open_last_workspace = false,
		}},
		["core.norg.journal"] = { config = {
			workspace = "journal",
		}},
		["core.gtd.base"] = { config = {
			workspace = "root"
		}},
		["core.norg.qol.toc"] = {},
		["core.integrations.telescope"] = {},
	}
}


if _G.GROCTEL_WORK_PC then
	setup.load["core.norg.dirman"].config.workspaces = {
		root = "~/Documents/Norg",
	}
else
	local neorg_root = "~/.local/norg"

	setup.load["core.norg.dirman"].config.workspaces = {
		root = neorg_root,

		home    = neorg_root.."/Home",
		journal = neorg_root.."/Journal",
		ugr     = neorg_root.."/UGR",
	}
end


require("neorg").setup(setup)


local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

parser_configs.norg_meta = {
	install_info = {
		url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
		files = { "src/parser.c" },
		branch = "main"
	},
}

parser_configs.norg_table = {
	install_info = {
		url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
		files = { "src/parser.c" },
		branch = "main"
	},
}
