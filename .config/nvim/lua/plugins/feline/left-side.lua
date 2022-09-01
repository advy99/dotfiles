local git       = require("plugins.feline.git")
local vi_mode   = require("plugins.feline.vi-mode")
local separator = require("plugins.feline.separator")

local colors = require("tokyonight.colors").setup()


local LEFT_SIDE = {}


LEFT_SIDE[1] = {
	provider = function () return " "..vi_mode.current_mode().." " end,
	update = {"ModeChanged"},
	hl = function ()
		local hl = vi_mode.current_hl()
		return {
			bg = hl.bg,
			fg = hl.fg,
			style = "bold"
		}
	end,
}


LEFT_SIDE[2] = {
	provider = separator.right,
	hl = function ()
		local hl = vi_mode.current_hl()
		return {
			bg = colors.fg_gutter,
			fg = hl.bg,
		}
	end,
}


LEFT_SIDE[3] = {
	provider = function () return "  "..git.status.head.." " end,
	enabled = function ()
		git.update()
		return git.file_is_in_repo()
	end,
	hl = {
		bg = colors.fg_gutter,
		fg = colors.fg,
		style = "bold"
	},
}


LEFT_SIDE[4] = {
	provider = separator.right,
	hl = function ()
		return {
			bg = (git.file_is_in_repo() and colors.green or colors.bg_highlight),
			fg = colors.fg_gutter,
		}
	end,
}


LEFT_SIDE[5] = {
	provider = function ()
		local added = (git.status.added or 0)
		return ((added > 0) and "  "..added.." " or "")
	end,
	enabled = function () return git.file_is_in_repo() end,
	hl = {
		bg = colors.green,
		fg = colors.bg_highlight,
		style = "bold"
	}
}


LEFT_SIDE[6] = {
	provider = separator.right,
	enabled = function () return git.file_is_in_repo() end,
	hl = {
		bg = colors.orange,
		fg = colors.green,
	},
}


LEFT_SIDE[7] = {
	provider = function ()
		local changed = (git.status.changed or 0)
		return ((changed > 0) and " 🡽 "..changed.." " or "")
	end,
	enabled = function () return git.file_is_in_repo() end,
	hl = {
		bg = colors.orange,
		fg = colors.bg_highlight,
		style = "bold"
	}
}


LEFT_SIDE[8] = {
	provider = separator.right,
	enabled = function () return git.file_is_in_repo() end,
	hl = {
		bg = colors.magenta2,
		fg = colors.orange,
	},
}


LEFT_SIDE[9] = {
	provider = function ()
		local removed = (git.status.removed or 0)
		return ((removed > 0) and " 🞮 "..removed.." " or "")
	end,
	enabled = function () return git.file_is_in_repo() end,
	hl = {
		bg = colors.magenta2,
		fg = colors.bg_highlight,
		style = "bold"
	}
}


LEFT_SIDE[10] = {
	provider = separator.right,
	enabled = function () return git.file_is_in_repo() end,
	hl = {
		bg = colors.bg_highlight,
		fg = colors.magenta2,
	},
}


return LEFT_SIDE
