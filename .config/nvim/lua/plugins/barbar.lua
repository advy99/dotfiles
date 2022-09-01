local api = vim.api

vim.g.bufferline = {
	animation       = true,
	closable        = false,
	icons           = true,
	maximum_padding = 1,
	no_name_title   = "[New buffer]",
}

api.nvim_set_keymap("n", "<C-n>",   "<cmd>BufferNext<cr>",         { noremap = true, silent = true })
api.nvim_set_keymap("n", "<C-p>",   "<cmd>BufferPrevious<cr>",     { noremap = true, silent = true })
api.nvim_set_keymap("n", "<C-A-n>", "<cmd>BufferMoveNext<cr>",     { noremap = true, silent = true })
api.nvim_set_keymap("n", "<C-A-p>", "<cmd>BufferMovePrevious<cr>", { noremap = true, silent = true })

vim.cmd([[
	cabbrev bdel  BufferDelete
	cabbrev bnext BufferNext
	cabbrev bprev BufferPrevious
	cabbrev bwipe BufferWipeout

	cabbrev bd BufferDelete
	cabbrev bn BufferNext
	cabbrev bp BufferPrevious
	cabbrev bw BufferWipeout
]])
