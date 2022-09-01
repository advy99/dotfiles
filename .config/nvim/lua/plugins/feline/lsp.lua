local LSP = {}

LSP.clients = {}


function LSP.clients_are_attached ()
	return (next(LSP.clients) ~= nil)
end


function LSP.clients_names ()
	local clients = {}
	local names   = ""
	if LSP.clients ~= nil then
		for _, client in pairs(LSP.clients) do
			clients[#clients+1] = client.name
		end
		names = table.concat(clients, " ")
	end
	return names
end


function LSP.update ()
	LSP.clients = vim.lsp.get_active_clients({bufnr = 0})
end


return LSP
