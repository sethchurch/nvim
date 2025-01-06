-- [[ Commands ]]
local map = vim.keymap.set

-- Escape Highlight
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Open Tmux Session
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer.sh<CR>", { desc = "Open new tmux session" })

-- Save File
map({ "n" }, "<leader>ww", "<cmd>w<cr><esc>", { desc = "Save File" })
map({ "n" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Diagnostics
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
map("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, {})
map("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, {})

-- Escape Terminal Mode
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Split Navigation
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Open Lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Open Lazy" })

-- [[ Auto Commands ]]
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on Yank
autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function() vim.highlight.on_yank() end,
})

-- Side Panel Help
autocmd("FileType", {
  pattern = "help",
  callback = function() vim.cmd("wincmd H") end,
})

-- vim: ts=2 sts=2 sw=2 et
