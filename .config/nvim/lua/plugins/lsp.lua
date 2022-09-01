local lsp   = require("lspconfig")
local navic = require("nvim-navic")


local setups = {
	bashls = {},
	cmake = {},
	intelephense = {},
	pyright = {},
	rust_analyzer = {},
	texlab = {},
	tsserver = {},
	vimls = {},

	cssls = {
		cmd = { "vscode-css-languageserver", "--stdio" }
	},

	html = {
		cmd = { "vscode-html-languageserver", "--stdio" }
	},

	sumneko_lua = { settings = { Lua = {
		diagnostics = {
			globals = { "_G", "packer_plugins", "vim" },
		},
	}}}
}


if _G.GROCTEL_WORK_PC then
	local sumneko_root = os.getenv("HOME").."/.local/repo/lua-language-server"
	local sumneko_bin  = sumneko_root.."/bin/lua-language-server"
	setups.sumneko_lua.cmd = { sumneko_bin, "-E", sumneko_root.."/main.lua" }
end


for server, setup in pairs(setups) do
	lsp[server].setup(setup)
end


require("clangd_extensions").setup({
	server = {
		on_attach = function(client, bufnr)
			navic.attach(client, bufnr)
		end
	},
	extensions = {
		ast = {
			role_icons = {
				declaration = '⯆',
				expression = '│',
				specifier = '',
				statement = '⯈',
				type = 'λ',
				['template argument'] = '',
			},
		},
		inlay_hints = { only_current_line = true },
		symbol_info = { border = "solid" },
	}
})


vim.cmd([[
	sign define DiagnosticSignError text=✘ texthl=DiagnosticSignError
	sign define DiagnosticSignWarn  text=⏺ texthl=DiagnosticSignWarn
	sign define DiagnosticSignInfo  text= texthl=DiagnosticSignInfo
	sign define DiagnosticSignHint  text= texthl=DiagnosticSignHint
]])
