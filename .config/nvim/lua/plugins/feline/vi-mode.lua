local colors = require("tokyonight.colors").setup()


local mode_bgs = {
	R      = colors.purple,
	Rv     = colors.purple,
	S      = colors.orange,
	V      = colors.red,
	[''] = colors.orange,
	[''] = colors.red,
	['!']  = colors.red,
	['r?'] = colors.cyan,
	c      = colors.magenta,
	i      = colors.green,
	ic     = colors.yellow,
	ix     = colors.yellow,
	n      = colors.cyan,
	r      = colors.cyan,
	rm     = colors.cyan,
	s      = colors.orange,
	t      = colors.purple,
	v      = colors.red,
}

local mode_names = {
	R      = "REPLACE",
	Rv     = "REPLACE",
	S      = "SELECT",
	V      = "VISUAL",
	[''] = "SELECT",
	[''] = "VISUAL",
	['!']  = "SHELL",
	['r?'] = "CONFIRM",
	c      = "COMMAND",
	i      = "INSERT",
	ic     = "INSERT",
	ix     = "INSERT",
	n      = "NORMAL",
	r      = "WAITING",
	rm     = "MORE...",
	s      = "SELECT",
	t      = "TERMINAL",
	v      = "VISUAL",
}


local VI_MODE = {}


function VI_MODE.current_hl ()
	return {
		bg = mode_bgs[vim.fn.mode()],
		fg = colors.bg
	}
end


function VI_MODE.current_mode ()
	return mode_names[vim.fn.mode()]
end


return VI_MODE
