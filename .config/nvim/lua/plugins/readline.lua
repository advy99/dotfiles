local readline = require("readline")

local commands = {
	["<C-a>"]  = readline.beginning_of_line,
	["<C-b>"]  = "<Left>",
	["<C-d>"]  = "<Delete>",
	["<C-e>"]  = readline.end_of_line,
	["<C-f>"]  = "<Right>",
	["<C-h>"]  = "<BS>",
	["<C-k>"]  = readline.kill_line,
	["<C-n>"]  = "<Down>",
	["<C-p>"]  = "<Up>",
	["<C-u>"]  = readline.backward_kill_line,
	["<C-v>"]  = "<C-v>",
	["<C-w>"]  = readline.unix_word_rubout,
	["<M-BS>"] = readline.backward_kill_word,
	["<M-b>"]  = readline.backward_word,
	["<M-d>"]  = readline.kill_word,
	["<M-f>"]  = readline.forward_word,
	["<M-m>"]  = readline.back_to_indentation,
}

for shortcut, action in pairs(commands) do
	vim.keymap.set("!", shortcut, action)
end
