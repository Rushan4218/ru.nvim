-- set leader key to <space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- sets relative line number
vim.opt.number = true
vim.opt.relativenumber = true

-- sets tab width to 2
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- sets caseinsensitive searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- sets <Esc> key to clear highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- update search results as you type and heighlight search term 
vim.opt.incsearch = true
vim.opt.hlsearch = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.cursorline = true
vim.opt.termguicolors = true

vim.opt.showmode = false

-- diagnostic config
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true
})


-- window decoration
vim.o.winborder = "rounded"

-- clipboard 
vim.opt.clipboard = "unnamedplus"

-- scroll starts at 8th line from the beginning/end
vim.opt.scrolloff = 8

-- command window only appears when needed
vim.opt.cmdheight = 0


