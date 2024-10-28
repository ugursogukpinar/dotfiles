-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.cmd("language en_US")
vim.o.exrc = true
vim.o.secure = true
vim.opt.winbar = "%=%m %f"
vim.opt.showtabline = 0
vim.opt.hidden = false

vim.g.autoformat = true
vim.g.omni_sql_no_default_maps = 1
-- vim.cmd("colorscheme murphy")
--
vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_python_ruff = "ruff"

-- vim.opt.clipboard = ""
