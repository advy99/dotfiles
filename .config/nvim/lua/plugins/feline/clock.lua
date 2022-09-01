local separator = require("plugins.feline.separator")
local colors    = require("tokyonight.colors").setup()


local time = ""
local hl   = {}

local function update_time ()
	local time_str = vim.fn.system([[date "+%H:%M"]]):sub(1, -2)
	local hour = tonumber(time_str:sub(1, 2))

	if (hour > 20) then
		time = "  "..time_str
		hl = {bg = colors.blue7,  fg = colors.fg}
	elseif (hour > 17) then
		time = "  "..time_str
		hl = {bg = colors.green,  fg = colors.bg}
	elseif (hour > 11) then
		time = "  "..time_str
		hl = {bg = colors.blue1,  fg = colors.bg}
	elseif (hour > 7) then
		time = "  "..time_str
		hl = {bg = colors.yellow, fg = colors.bg}
	else
		time = "  "..time_str
		hl = {bg = colors.blue7,  fg = colors.fg}
	end
end


local CLOCK = {}


CLOCK[1] = {
	provider = function () update_time() return separator.left end,
	hl = function ()
		return {
			bg = colors.bg,
			fg = hl.bg,
		}
	end,
}


CLOCK[2] = {
	provider = function () return " "..time.." " end,
	hl = function ()
		return {
			bg = hl.bg,
			fg = hl.fg,
		}
	end,
}


return CLOCK
