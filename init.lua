-- Set up leader key
vim.g.mapleader = " "

-- set up lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- set color
vim.cmd([[colorscheme kanagawa]])

-- bind keys
require("keymaps")

--options
require("options")

--center cursor
vim.cmd([[
  augroup CenterCursor
    autocmd!
    autocmd CursorMoved,CursorMovedI * lua CenterCursor()
  augroup END
]])

function CenterCursor()
	local pos = vim.api.nvim_win_get_cursor(0)
	vim.cmd("normal! zz")
	vim.api.nvim_win_set_cursor(0, pos)
end
