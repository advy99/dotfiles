--[[
	INIT.LUA BY ATANASIO "GROCTEL" RUBIO ---- git@taxorubio.com

	Dependencies (as named in Arch official repos and AUR):
	> neovim-nightly-git: Latest version of Neovim. Required by many plugins.
	> ngrok: Set up public server for instant.nvim.
	> Language servers: Check lua/plugins/lsp.lua.
--]]


local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then impatient.enable_profile() end

if vim.opt.compatible then vim.opt.compatible = false end

require "plugins"
require "user"
