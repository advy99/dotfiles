local lsp       = require("plugins.feline.lsp")
local separator = require("plugins.feline.separator")
local vi_mode   = require("plugins.feline.vi-mode")

local colors   = require("tokyonight.colors").setup()
local devicons = require("nvim-web-devicons")


local function cursor_info ()
	local cursor = vim.api.nvim_win_get_cursor(0)
	local lines  = vim.api.nvim_buf_line_count(0)
	return cursor[1]..'·'..lines..':'..cursor[2]
end


local function file_info ()
	local format_icon = {["dos"] = " ", ["mac"] = " ", ["unix"] = " "}
	local encoding = string.upper(vim.o.fileencoding)
	local format   = format_icon[vim.o.fileformat]
	return encoding.." "..format..""
end


local RIGHT_SIDE = {}


RIGHT_SIDE[1] = {
	provider = function ()
		return separator.thin_left.." "..vim.o.filetype.." "
	end,
	enabled = function () return (vim.o.filetype ~= "") end,
	hl = {
		bg = colors.bg_highlight,
		fg = colors.fg,
		style = "bold",
	},
}


RIGHT_SIDE[2] = {
	provider = function ()
		local filename = vim.api.nvim_buf_get_name(0)
		local icon = devicons.get_icon(filename, nil)
		return icon and icon.."  " or ""
	end,
	enabled = function () return (vim.o.filetype ~= "") end,
	hl = function ()
		local filename = vim.api.nvim_buf_get_name(0)
		local _, fg = devicons.get_icon_color(filename, nil)
		return {
			bg = colors.bg_highlight,
			fg = fg,
			style = "bold",
		}
	end,
}


RIGHT_SIDE[3] = {
	provider = separator.left,
	enabled = function ()
		lsp.update()
		return lsp.clients_are_attached()
	end,
	hl = {
		bg = colors.bg_highlight,
		fg = colors.magenta2,
	},
}


RIGHT_SIDE[4] = {
	provider = function ()
		local errors = vim.diagnostic.get(0, {
			severity = vim.diagnostic.severity.ERROR
		})
		return (#errors > 0 and " ✘"..#errors.." " or "")
	end,
	enabled = function () return lsp.clients_are_attached() end,
	hl = {
		bg = colors.magenta2,
		fg = colors.bg_highlight,
		style = "bold",
	},
}


RIGHT_SIDE[5] = {
	provider = separator.left,
	enabled = function () return lsp.clients_are_attached() end,
	hl = {
		bg = colors.magenta2,
		fg = colors.orange,
	},
}


RIGHT_SIDE[6] = {
	provider = function ()
		local warnings = vim.diagnostic.get(0, {
			severity = vim.diagnostic.severity.WARN
		})
		return (#warnings > 0 and " "..#warnings.." " or "")
	end,
	enabled = function () return lsp.clients_are_attached() end,
	hl = {
		bg = colors.orange,
		fg = colors.bg_highlight,
		style = "bold",
	},
}


RIGHT_SIDE[7] = {
	provider = separator.left,
	enabled = function () return lsp.clients_are_attached() end,
	hl = {
		bg = colors.orange,
		fg = colors.green,
	},
}


RIGHT_SIDE[8] = {
	provider = function ()
		local hints = vim.diagnostic.get(0, {
			severity = vim.diagnostic.severity.HINT
		})
		return (#hints > 0 and " "..#hints.." " or "")
	end,
	enabled = function () return lsp.clients_are_attached() end,
	hl = {
		bg = colors.green,
		fg = colors.bg_highlight,
		style = "bold",
	},
}


RIGHT_SIDE[9] = {
	provider = separator.left,
	enabled = function () return lsp.clients_are_attached() end,
	hl = {
		bg = colors.green,
		fg = colors.blue0,
	},
}


RIGHT_SIDE[10] = {
	provider = function ()
		local infos = vim.diagnostic.get(0, {
			severity = vim.diagnostic.severity.INFO
		})
		return (#infos > 0 and " "..#infos.." " or "")
	end,
	enabled = function () return lsp.clients_are_attached() end,
	hl = {
		bg = colors.blue0,
		fg = colors.fg,
		style = "bold",
	},
}


RIGHT_SIDE[11] = {
	provider = separator.left,
	hl = function ()
		local bg = (lsp.clients_are_attached() and colors.blue0 or colors.bg_highlight)
		return {
			bg = bg,
			fg = colors.green2
		}
	end
}


RIGHT_SIDE[12] = {
	provider = function () return "  "..lsp.clients_names().." " end,
	enabled = function () return lsp.clients_are_attached() end,
	hl = {
		bg = colors.green2,
		fg = colors.bg_highlight,
		style = "bold"
	},
}


RIGHT_SIDE[13] = {
	provider = separator.left,
	hl = {
		bg = colors.green2,
		fg = colors.terminal_black,
	},
}


RIGHT_SIDE[14] = {
	provider = function () return " "..file_info().." " end,
	hl = {
		bg = colors.terminal_black,
		fg = colors.fg,
		style = "bold",
	},
}


RIGHT_SIDE[15] = {
	provider = separator.left,
	hl = function ()
		return {
			bg = colors.terminal_black,
			fg = vi_mode.current_hl().bg,
		}
	end,
}


RIGHT_SIDE[16] = {
	provider = function () return " ═ "..cursor_info().." " end,
	hl = function ()
		local hl = vi_mode.current_hl()
		return {
			bg = hl.bg,
			fg = hl.fg,
			style = "bold",
		}
	end,
}


return RIGHT_SIDE
