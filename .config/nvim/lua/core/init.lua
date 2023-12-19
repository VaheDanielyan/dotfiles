require("core.remaps")
require("core.packer")

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.expandtab = true
vim.opt.relativenumber = true
vim.opt.nu = true

vim.opt.encoding = "UTF-8"
vim.opt.errorbells = false

vim.opt.incsearch = true
vim.opt.hlsearch = false

vim.opt.wildmenu = true
vim.opt.cmdheight = 1

vim.opt.updatetime = 50
vim.opt.scrolloff = 8

vim.cmd.colorscheme("onedark")

vim.opt.foldlevel = 99
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
