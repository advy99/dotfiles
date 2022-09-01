require("Comment").setup({
	ignore = "^$"
})

vim.api.nvim_set_keymap("n", "gC", "gc$", {noremap = false})
