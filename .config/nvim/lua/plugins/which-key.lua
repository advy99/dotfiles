local wk = require("which-key")

wk.setup({
	triggers = "auto",
	plugins = { spelling = {
		enabled = true,
		suggestions = 20,
	}},
})

-- local norgpath = "~/Documents/Norg/"
local diagnostics_active = true

local function toggle_diagnostics ()
	diagnostics_active = not diagnostics_active
	if diagnostics_active then
		vim.diagnostic.show()
	else
		vim.diagnostic.hide()
	end
end


local key_tree = {
	b = { "<cmd>Telescope buffers<cr>", "Buffers" },
	c = { "<cmd>ColorizerToggle<cr>", "Toggle colours" },
	f = { "<cmd>Telescope find_files<cr>", "Find file" },
	F = { "<cmd>NvimTreeToggle .<cr>", "File tree" },

	g = {
		name = "+Git...",
		a = { "<cmd>Git add %<cr>", "git add", silent = false },
		b = { "<cmd>Git blame<cr>", "git blame" },
		B = { "<cmd>Telescope git_branches<cr>", "git branch" },
		c = { "<cmd>Neogit commit<cr>", "git commit" },
		C = {
			name = "Commits...",
			b = { "<cmd>Telescope git_bcommits<cr>", "Buffer local commits" },
			C = { "<cmd>Telescope git_commits<cr>", "Commits history" },
		},
		d = { "<cmd>DiffviewOpen<cr>", "git diff" },
		g = { "<cmd>Neogit kind=split<cr>", "Neogit" },
		f = { "<cmd>Telescope git_files<cr>", "Inspect files" },
		i = { "<cmd>Git init<cr>", "git init" },
		l = { "<cmd>Git log<cr>", "git log" },
		L = { "<cmd>Git log --oneline --decorate --graph<cr>", "git log graph" },
		m = { "<cmd>Merginal<cr>", "git merge", silent = false },
		p = { "<cmd>Neogit pull<cr>", "git pull" },
		P = { "<cmd>Neogit push<cr>", "git push" },
		s = { "<cmd>Telescope git_status<cr>", "git status" },
		S = { "<cmd>Telescope git_stash<cr>", "git stash" },
		w = { "<cmd>Git whatchanged<cr>", "git whatchanged" },
		x = {
			name = "+Conflicts...",
			b = { "<cmd>GitConflictChooseBoth<cr>", "Adopt both changes" },
			i = { "<cmd>GitConflictChooseTheirs<cr>", "Adopt incoming changes" },
			n = { "<cmd>GitConflictNextConflict<cr>", "Next conflict" },
			o = { "<cmd>GitConflictChooseOurs<cr>", "Adopt our changes" },
			p = { "<cmd>GitConflictPrevConflict<cr>", "Previous conflict" },
			q = { "<cmd>GitConflictListQf<cr>", "Open quickfix" },
			r = { "<cmd>GitConflictChooseNone<cr>", "Reject both changes" },
		},
	},

	h = { "<cmd>nohl<cr>", "Disable highlight" },

	j = {
		name = "+Jump to...",
		d = { "<cmd>Telescope lsp_definitions<cr>", "Definition" },
		h = { "<cmd>ClangdSwitchSourceHeader<cr>", "Header/Source" },
		s = { "<cmd>Telescope live_grep<cr>", "Arbitrary string" },
		S = { "<cmd>Telescope grep_string<cr>", "String below cursor" },
	},

	J = {
		name = "+Job splits...",
		c = { "<cmd>Jobclose<cr>", "Close all jobs" },
		j = { "<cmd>Jobsplit!<cr>", "New job" },
		J = { "<cmd>Jobsplit<cr>", "New job (keep others)" },
		r = { "<cmd>Jobrepeat!<cr>", "Repeat latest job" },
		R = {  "<cmd>Jobrepeat<cr>", "Repeat latest job (keep others)"  },
	},

	l = {
		name = "+LSP...",
		a = { "<cmd>CodeActionMenu<cr>", "Code actions" },
		d = { "<cmd>LSPLinesToggle<cr>", "Toggle diagnostics lines" },
		D = { toggle_diagnostics, "Toggle diagnostics" },
		i = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Symbol info" },
		I = { "<cmd>LspInfo<cr>", "Server info" },
		r = { "<cmd>IncRename<cr>", "Rename symbol" },
		R = { "<cmd>LspRestart<cr>", "Restart" },
		s = { "<cmd>LspStart<cr>", "Start" },
		S = { "<cmd>LspStop<cr>", "Stop" },
		t = { "<cmd>TroubleToggle<cr>", "Trouble" },
	},

	m = {
		name = "+Make...",
		a = { "<cmd>Jobsplit! make all<cr>", "make all" },
		b = { "<cmd>Jobsplit! make build<cr>", "make build" },
		c = { "<cmd>Jobsplit! make clean<cr>", "make clean" },
		d = { "<cmd>Jobsplit! make directories<cr>", "make directories" },
		m = { "<cmd>Jobsplit! make<cr>", "make" },
		n = { "<cmd>Jobsplit! make -n<cr>", "make -n" },
		r = { "<cmd>Jobsplit! make run<cr>", "make run" },
		R = { "<cmd>Jobsplit! make remake<cr>", "make remake" },
		t = { "<cmd>Jobsplit! make test<cr>", "make test" },
		[" "] = { ":Jobsplit! make ", "make...", silent = false },
	},

	M = { "<cmd>Telescope man_pages<cr>", "Man pages" },

	n = {
		name = "+Neorg...",
		g = { "<cmd>Neorg gtd views<cr>", "GTD views" },
		G = {
			name = "+GTD...",
			c = { "<cmd>Neorg gtd capture<cr>", "Create task" },
			e = { "<cmd>Neorg gtd edit<cr>", "Edit task" },
		},
	},

	s = {
		name = "+Spelling...",
		s = { ":setlocal spell spelllang=", "Spelling",          silent = false },
		S = { ":set spell spelllang=",      "Spelling (global)", silent = false },
		[" "] = { "]szzz=", "Next mistake", silent = false }, -- TODO: Trigger WK here
	},

	t = {
		name = "+Terminal...",
		t = { "<cmd>FloatermToggle<cr>", "Open floating terminal" },
		T = { "<cmd>term<cr>", "Open terminal in buffer" },
		s = { "<cmd>split | term<cr>", "Split to terminal" },
		v = { "<cmd>vsplit | term<cr>", "Vsplit to terminal" },
	},

	T = { "<cmd>TodoTelescope<cr>",  "TODO appearances" },
	u = { "<cmd>UndotreeToggle<cr>", "UndoTree" },

	v = {
		name = "+Vim...",
		d = { "<cmd>Telescope find_files cwd=~/.config/nvim/<cr>", "Dotfiles" },
		s = { "<cmd>source $MYVIMRC<cr>", "Source vimrc" },
		h = { "<cmd>checkhealth<cr>", "Check nvim health" },
	},

	z = { "<cmd>Goyo | Limelight!! | Gitsigns toggle_signs<cr>", "Zen mode" },

	[" "] = { ":", "Enter command", silent = false },
	["<CR>"] = { ":!", "Enter system command", silent = false },
	["-"] = { "<cmd>Telescope command_history<cr>", "Command history" },
}


for i = 1,8 do
	local number = tostring(i)
	key_tree["j"][number] = { "<cmd>BufferGoto "..number.."<cr>", "Buffer "..number }
end


local visual_key_tree = {
	s = {
		name = "+Sort...",
		s = { ":'<,'>sort\n", "Sort" },
		u = { ":'<,'>sort u\n", "Sort uniq" },
	}
}


wk.register(key_tree, { prefix = "<leader>" })
wk.register(visual_key_tree, { prefix = "<leader>", mode = "v" })
