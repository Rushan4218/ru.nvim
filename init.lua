require("config.options")
require("config.keymaps")
require("config.terminal")

-- path where lazy vim should live
-- this would be somewhere like `.local/share/nvim/lazy/lazy.nvim`
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- if it's not there, clone it from github
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.number = true

-- this tells nvim where to find it
-- because of this, we can use require("lazy") because nvim now knows where to find it
vim.opt.rtp:prepend(lazypath)

-- this loads lazy.nvim
require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
})
