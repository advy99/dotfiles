local lines = require("lsp_lines")
lines.setup({ virtual_lines = false })

local first_call = true


vim.api.nvim_create_user_command("LSPLinesToggle", function ()
	-- HACK: Open PR to remove this requirement (allow toggle when loading)
	if first_call then
		lines.toggle()
		first_call = false
	end

	vim.diagnostic.config({ virtual_text = not lines.toggle() })
end, {})
