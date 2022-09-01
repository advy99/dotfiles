-- local colors = require("tokyonight.colors").setup()
-- local gps    = require("nvim-gps")
local navic = require("nvim-navic")

-- gps.setup({
-- 	separator = "  ",
-- })

navic.setup {
	highlight = true,
	separator = "  ",
	depth_limit = 0,
	depth_limit_indicator = "...",
}


local WINBAR = {}

-- WINBAR[1] = {
-- 	provider = function() return gps.get_location() end,
-- 	enabled = function() return gps.is_available() end,
-- 	hl = {
-- 		bg = colors.bg_dark,
-- 		fg = colors.fg,
-- 	},
-- }


WINBAR[1] = {
	provider = function () return navic.get_location() end,
	enabled  = function () return navic.is_available() end,
}

return WINBAR
