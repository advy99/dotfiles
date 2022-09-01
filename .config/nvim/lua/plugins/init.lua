local fn = vim.fn


-- Automatically install packer
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git", "clone", "--depth", "1",
		"https://github.com/wbthomason/packer.nvim", install_path,
	})
	vim.cmd([[packadd packer.nvim]])
end


-- Use a protected call so we don't error out on first use
local packer_ok, packer = pcall(require, "packer")
if not packer_ok then return end


-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function ()
			return require("packer.util").float({border = "rounded"})
		end,
	},
})


return packer.startup(function (use)
	use "wbthomason/packer.nvim"
	use "kyazdani42/nvim-web-devicons"
	use "lewis6991/impatient.nvim"
	use "nvim-lua/plenary.nvim"
	use { "nvim-treesitter/nvim-treesitter",
		requires = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/playground",
		},
		run = ":TSUpdate",
		config = function () require "plugins.treesitter" end
	}

	-- Completion and language server utilities
	use { "folke/trouble.nvim", opt = true,
		requires = "kyazdani42/nvim-web-devicons",
		cmd = "TroubleToggle"
	}
	use { "hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-latex-symbols",
			"hrsh7th/cmp-path",
			"onsails/lspkind.nvim",
			{ "hrsh7th/cmp-nvim-lsp",
				requires = "neovim/nvim-lspconfig"
			},
			{ "saadparwaiz1/cmp_luasnip",
				requires = "L3MON4D3/LuaSnip",
				config = function () require "plugins.luasnip" end,
			},
		},
		config = function () require "plugins.cmp" end
	}
	use { "kosayoda/nvim-lightbulb",
		config = function () require "plugins.lightbulb" end
	}
	use { "neovim/nvim-lspconfig",
		requires = "p00f/clangd_extensions.nvim",
		ft = {
			"bash", "c", "cpp", "cmake", "css", "html", "javascript", "lua",
			"python", "rust", "sh", "tex", "typescript", "vim"
		},
		config = function () require "plugins.lsp" end
	}
	use { "smjonas/inc-rename.nvim", opt = true,
		cmd = "IncRename",
		config = function () require("inc_rename").setup() end,
	}
	use { "https://git.sr.ht/~whynothugo/lsp_lines.nvim", opt = true,
		cmd = "LSPLinesToggle",
		config = function () require "plugins.lsp-lines" end,
	}

	-- Git
	use "tpope/vim-fugitive"
	use { "akinsho/git-conflict.nvim",
		config = function () require "plugins.git-conflict" end
	}
	use { "idanarye/vim-merginal", opt = true,
		cmd = "Merginal"
	}
	use { "lewis6991/gitsigns.nvim",
		config = function () require "plugins.gitsigns" end
	}
	use { "TimUntersberger/neogit", opt = true,
		cmd = {
			"DiffviewOpen", "DiffviewLog", "DiffviewClose", "DiffviewRefresh",
			"DiffviewFocusFiles", "DiffviewFileHistory", "DiffviewToggleFiles",
			"Neogit" },
		requires = { "sindrets/diffview.nvim",
			config = function () require "plugins.diffview" end,
		},
		config = function ()
			require "plugins.neogit"
		end,
	}

	-- Miscellanea
	use { "https://gitlab.com/Groctel/jobsplit.vim", opt = true,
		cmd = { "Jobclose", "Jobrepeat", "Jobsplit" }
	}
	use { "folke/todo-comments.nvim",
		config = function () require("todo-comments").setup({}) end
	}
	use { "norcalli/nvim-colorizer.lua",
		config = function () require "plugins.colorizer" end
	}
	use { "nvim-neorg/neorg",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-neorg/neorg-telescope",
			"nvim-treesitter/nvim-treesitter",
		},
		ft = "norg",
		config = function () require "plugins.neorg" end,
	}
	use "rktjmp/highlight-current-n.nvim"
	-- WARN: Requires lots of fixes upstream
	-- use { "jbyuki/nabla.nvim", opt = true,
	-- 	ft = "tex",
	-- }
	-- Motions and editions
	use "chaoren/vim-wordmotion"
	use "matze/vim-move"
	use "wellle/targets.vim"
	use { "AndrewRadev/tagalong.vim",
		requires = "tpope/vim-repeat"

	}
	use { "anuvyklack/hydra.nvim",
		config = function () require "plugins.hydra" end
	}
	use { "inkarkat/vim-ReplaceWithRegister",
		requires = "tpope/vim-repeat"
	}
	use { "linty-org/readline.nvim", opt = true,
		event = "CmdlineEnter",
		config = function () require "plugins.readline" end
	}
	use { "nmac427/guess-indent.nvim",
		config = function () require("guess-indent").setup({}) end,
	}
	use { 'numToStr/Comment.nvim',
		config = function () require "plugins.comment" end
	}
	use { "tpope/vim-surround",
		requires = "tpope/vim-repeat"
	}
	use { "junegunn/vim-easy-align",
		config = function ()
			vim.api.nvim_set_keymap("n", "ga", "<Plug>(EasyAlign)", {})
			vim.api.nvim_set_keymap("x", "ga", "<Plug>(EasyAlign)", {})
		end,
	}
	use { "mattn/emmet-vim",
		config = function () require "plugins.emmet" end,
	}

	-- User interface
	use "voldikss/vim-floaterm"
	use { "folke/which-key.nvim",
		config = function () require "plugins.which-key" end
	}
	use { "feline-nvim/feline.nvim",
		requires = "SmiteshP/nvim-gps",
		config = function () require "plugins.feline" end,
	}
	use { "folke/tokyonight.nvim",
		config = function ()
			vim.g.tokyonight_style = "night"
			vim.cmd([[
				colorscheme tokyonight
				hi! link CursorLineNr MatchParen
				hi! link WinSeparator LineNr
			]])
		end,
	}
	use { "junegunn/goyo.vim", opt = true,
		cmd = "Goyo",
		requires = "junegunn/limelight.vim",
	}
	use { "kyazdani42/nvim-tree.lua", opt = true,
		cmd = "NvimTreeToggle",
		config = function () require "plugins.nvim-tree" end
	}
	use { "mbbill/undotree", opt = true,
		cmd = "UndotreeToggle",
		config = function ()
			vim.g.undotree_SetFocusWhenToggle = 1
			vim.g.undotree_ShortIndicators    = 1
			vim.g.undotree_TreeNodeShape      = "◯"
			vim.g.undotree_WindowLayout       = 2
		end,
	}
	use { "mfussenegger/nvim-dap",
		requires = "rcarriga/nvim-dap-ui",
		config = function () require "plugins.dap" end,
	}
	use { "nvim-telescope/telescope.nvim", opt = true,
		cmd = "Telescope",
		requires = {
			"kyazdani42/nvim-web-devicons",
			"nvim-telescope/telescope-ui-select.nvim"
		},
		config = function () require "plugins.telescope" end,
	}
	use { "romgrk/barbar.nvim",
		config = function () require "plugins.barbar" end
	}
	use { "weilbith/nvim-code-action-menu", opt = true,
		cmd = "CodeActionMenu",
	}

	use "puremourning/vimspector"
	use { "SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig"
	}

	use "lervag/vimtex"


	-- use "Groctel/welcome-nvim/"

	--------------------------------------------------------------

	-- use "akinsho/toggleterm.nvim"
	-- use "ahmedkhalf/project.nvim"
	-- use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight

	-- -- snippets
	-- use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
	-- if PACKER_BOOTSTRAP then require("packer").sync() end
end)
