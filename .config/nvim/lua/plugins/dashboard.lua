local dashboard = require("dashboard")
local splashes = vim.fn.stdpath("config").."/splashes"


local function render_header ()
	local header = {
		[[                                                  ]],
		[[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
		[[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
		[[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
		[[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
		[[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
		[[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
		[[                                                  ]],
	}

	local splash = "[ "..vim.fn.system("shuf -n 1 "..splashes):sub(1,-2).."! ]"

	-- Add the splash string followed by two empty lines
	table.insert(header, splash)
	table.insert(header, header[1])
	table.insert(header, header[1])
	table.insert(header, header[1])
	return header
end


local newfile = { icon = "  ",
	action = "enew",
}
local findfile = { icon = "  ",
	action = "Telescope find_files hidden=true no_ignore=true",
}
local dots = { icon = "  ",
	action = "Telescope find_files cwd=~/.config/nvim/"
	.." search_dirs=Ultisnips,lua,init.lua,splashes",
}
local update = { icon = "  ",
	action = "PackerSync",
}
local term = { icon = "  ",
	action = "FloatermToggle",
}
local close = { icon = "  ",
	action = "qa!",
}

newfile.desc  = "New file                             "
findfile.desc = "Find file                            "
dots.desc     = "Browse dotfiles                      "
update.desc   = "Update plugins                       "
term.desc     = "Open floating terminal               "
close.desc    = "Close neovim                         "

newfile.shortcut  = "      :enew"
findfile.shortcut = "      SPC f"
dots.shortcut     = "    SPC v d"
update.shortcut   = ":PackerSync"
term.shortcut     = "    SPC t t"
close.shortcut    = "       :qa!"


dashboard.custom_header = render_header
dashboard.custom_center = {
	newfile,
	findfile,
	dots,
	update,
	term,
	close,
}
dashboard.custom_footer = {"", "neovim loaded "..#vim.tbl_keys(packer_plugins).." plugins"}

local augroup = vim.api.nvim_create_augroup("AU_dashboard", {clear = true})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "dashboard",
	group = augroup,
	callback = function ()
		vim.api.nvim_buf_set_keymap(0, "n", "q", "<cmd>quit!<cr>", {noremap = true, silent = true})
	end,
})
