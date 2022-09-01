local colors  = require("tokyonight.colors").setup()


local clock = {
	current_icon = "",
	current_hour = 99,
	current_minute = 0,
	time = "",
	hl   = {},
}


local function update_time ()
	local hour = tonumber(vim.fn.strftime("%H"))
	clock.current_minute = vim.fn.strftime("%M")

	if (hour ~= clock.current_hour) then
		clock.current_hour = hour

		if (hour > 20) then
			clock.current_icon = "  "
			clock.hl = {bg = colors.blue7,  fg = colors.fg}
		elseif (hour > 17) then
			clock.current_icon = "  "
			clock.hl = {bg = colors.green,  fg = colors.bg}
		elseif (hour > 11) then
			clock.current_icon = "  "
			clock.hl = {bg = colors.blue1,  fg = colors.bg}
		elseif (hour > 7) then
			clock.current_icon = "  "
			clock.hl = {bg = colors.yellow, fg = colors.bg}
		else
			clock.current_icon = "  "
			clock.hl = {bg = colors.blue7,  fg = colors.fg}
		end
	end

	return {
		time = clock.current_icon..clock.current_hour..":"..clock.current_minute,
		hl = clock.hl,
	}
end


local function render (f)
	local function render_buffer (info)
		f.add({"█",
			bg = colors.bg_dark,
			fg = info.current and colors.fg_gutter or colors.bg_highlight
		})

		f.add({info.buf.." ",
			bg = info.current and colors.fg_gutter or colors.bg_highlight,
			fg = info.current and colors.blue2 or colors.blue5
		})

		f.add({info.filename and info.filename or "[New Buffer]",
			bg = info.current and colors.fg_gutter or colors.bg_highlight,
			fg = info.modified and colors.yellow or colors.fg
		})

		f.add({"█",
			bg = colors.bg_dark,
			fg = info.current and colors.fg_gutter or colors.bg_highlight
		})
	end

	f.add({"   ", fg = colors.blue})
	f.make_bufs(render_buffer)
	f.add_spacer()

	local tab_count = #vim.api.nvim_list_tabpages()

	if (tab_count > 1) then
		local current_tab = vim.api.nvim_get_current_tabpage()
		f.add(" "..current_tab.."/"..tab_count.." ")
	end

	local clock_module = update_time()

	f.add({"",
		fg = clock_module.hl.bg,
	})

	f.add({
		" "..clock_module.time.." ",
		fg = clock_module.hl.fg,
		bg = clock_module.hl.bg
	})
end


require("tabline_framework").setup {
	render = render,
	hl      = { fg = colors.fg_dark, bg = colors.bg_dark   },
	hl_sel  = { fg = colors.fg,      bg = colors.fg_gutter },
	hl_fill = { fg = colors.fg_dark, bg = colors.bg_dark   },
}
