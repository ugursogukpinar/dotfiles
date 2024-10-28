-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- DO NOT USE THIS IN YOU OWN CONFIG!!
-- use `vim.keymap.set` instead
local map = vim.keymap.set

map("n", "<C-a>", "ggVG", { desc = "Select all" })

map("n", "<C-Left>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-Down>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-Up>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-Right>", "<C-w>l", { desc = "Go to right window", remap = true })

map("n", "<C-S-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-S-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-S-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-S-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- local neovim = require("telescope.builtin")

map("n", "<C-p>", "<cmd>Telescope neovim-project discover<cr>", { desc = "Projects" })
map("n", "<C-f>", require("telescope.builtin").current_buffer_fuzzy_find, { desc = "Find in Current" })
map("n", "<leader>§", require("telescope.builtin").buffers, { desc = "Show open buffers" })
map("n", "<leader><space>", require("telescope.builtin").find_files, { desc = "Find Files" })

map("n", "<leader>ss", function()
  require("telescope.builtin").lsp_document_symbols({
    symbols = LazyVim.config.get_kind_filter(),
  })
end, { desc = "Goto Symbol (Document)" })

map("n", "<leader>sS", function()
  require("telescope.builtin").lsp_workspace_symbols({
    symbols = LazyVim.config.get_kind_filter(),
  })
end, { desc = "Goto Symbol (Workspace)" })

-- map(
--   "n",
--   "<leader>sS",
--   require("telescope.builtin").lsp_workspace_symbols({ query = vim.fn.input("") }),
--   { desc = "Search Workspace Symbols" }
-- )

map({ "n" }, "<leader>e", "<cmd>Neotree reveal position=float toggle<cr>", { desc = "Toggle neotree", remap = true })

-- Function to close all windows and open the dashboard
function OpenDashboard()
  -- Close all buffers
  -- vim.cmd("bufdo bdelete")
  vim.cmd("%bd")
  -- Open the dashboard
  vim.cmd("Dashboard") -- If using `dashboard-nvim`
  -- vim.cmd('Alpha')  -- If using `alpha-nvim`
end

-- Keybinding to trigger the function
vim.api.nvim_set_keymap("n", "<leader>kw", ":lua OpenDashboard()<CR>", { noremap = true, silent = true })
