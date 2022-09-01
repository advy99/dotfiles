local options = {
	autoindent = true, -- Start new lines correctly indented
	completeopt = { "menuone", "noselect" }, -- Completion engine options
	cursorline = true, -- Highlight the line where the cursor is (see cursorlineopt)
	cursorlineopt = "number", -- Highlight the cursor line number (see cursorline)
	expandtab = false, -- Do not expand tabs to spaces (see softtabstop)
	fillchars = vim.opt.fillchars + "diff:╱", -- Interface styling (see listchars)
	fixeol = true, -- Restore EOL at EOF if missing when writing
	foldlevel = 10, -- Don't fold segions below this level
	foldmethod = "marker", -- Only allow foldings with triple brackets
	guicursor = { a = "block" }, -- Force cursor to be a block at all times
	hidden = true, -- Hide inactive buffers instead of deleting them
	hlsearch = true, -- Highlight all search matches
	inccommand = "split", -- Incrementally show effects of commands, opens split
	incsearch = true, -- Highlight search matches while writing (with hlsearch)
	laststatus = 3, -- Use a global statusline instead of one per window
	linebreak = true, -- Respect WORDS when wrap-breaking lines (see wrap)
	list = true,
	listchars = { tab = '   ', trail = '·'},
	mouse = "nvi", -- Allow mouse everywhere except in command line mode
	nrformats = "unsigned", -- Treat all numbers as unsigned with <C-A> and <C-X>
	number = true, -- Number column to the left (used with relativenumber)
	relativenumber = true, -- Show numbers relative to cursor position (see number)
	scrolloff = 5, -- Leave 5 lines above and below cursor
	shiftwidth = 0, -- Force indent spaces to equal to tabstop (see tabstop)
	showcmd = true, -- Show the keys pressed in normal mode until action is run
	showtabline = 2, -- Show the tabline even when just one tab is open
	signcolumn = "yes", -- Always show the sign column beside the number (see number)
	smartindent = true, -- Ident new lines in a smart way (see autoindent)
	smarttab = true, -- Treat spaces as tabs in increments of shiftwidth
	softtabstop = 0, -- Do not insert spaces when pressing tab (see shiftwidth)
	splitbelow = true, -- Open splits below the current window
	splitright = true, -- Open splits right of the current window
	tabstop = 3, -- Number of columns to move when pressing <TAB> (see expandtab)
	termguicolors = true, -- Enable 24-bit RGB color in the TUI
	timeoutlen = 500, -- Milliseconds to wait before completing a mapped sequence
	updatetime = 300, -- Milliseconds to wait before writing to swap file
	wildignorecase = true, -- Ignore case in filenames browsed by wildmenu
	wrap = false, -- Do not wrap text that reaches the window's width
}


for key, val in pairs(options) do
	vim.opt[key] = val
end


vim.g.mapleader=" " -- Set leader key to space to call which-key
vim.g.tex_flavor = "latex" -- Treat all .tex files as LaTeX instead of TeX
vim.opt.colorcolumn:append("81") -- Draw column at line character limit
vim.opt.shortmess:append("c")


-- TODO: Replace vim commands
vim.cmd([[
	function! CustomFold()
		return printf('   %-7d%s', v:foldend - v:foldstart + 1, getline(v:foldstart))
	endfunction

	set fillchars+=fold:\ | set foldtext=CustomFold() " Minimalistic folding
	" set listchars=tab:\🭱\ ,trail:· list"Alternate tab: »>

]])
