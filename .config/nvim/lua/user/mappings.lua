-- Center search results
vim.api.nvim_set_keymap("n", "n", "nzz", {noremap = true})
vim.api.nvim_set_keymap("n", "N", "Nzz", {noremap = true})

-- Disable Ex mode
vim.api.nvim_set_keymap("n", "Q", "", {noremap = true})

-- Return to the last active buffer centering the line you were in
vim.api.nvim_set_keymap("n", "<BS>", [[<C-^>`"zz]], {noremap = true})

-- Double ESC to exit from terminal insert mode to terminal normal mode
vim.api.nvim_set_keymap("t", "<ESC><ESC>", [[<C-\><C-n>]], {noremap = true})

-- Repeat the last action on visual selections
vim.api.nvim_set_keymap("x", ".", "<cmd>normal!.<cr>", {noremap = true})

-- Stay in visual mode after indenting
vim.api.nvim_set_keymap("x", "<", "<gv", {noremap = true})
vim.api.nvim_set_keymap("x", ">", ">gv", {noremap = true})
