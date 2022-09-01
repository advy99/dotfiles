local feline = require("feline")
local colors = require("tokyonight.colors").setup()

local left_side  = require("plugins.feline.left-side")
local right_side = require("plugins.feline.right-side")
local winbar     = require("plugins.feline.winbar")


local line_components = {
	active   = {left_side, right_side},
	inactive = {},
}

local winbar_components = {
	active   = {winbar},
	inactive = {},
}

local force_inactive = {
	filetypes = {},
	buftypes  = {},
	bufnames  = {}
}


feline.setup({
	components     = line_components,
	force_inactive = force_inactive,
	theme          = colors,
})

feline.winbar.setup({
	components     = winbar_components,
	force_inactive = force_inactive,
	theme          = colors,
})
