local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.signcolumn = "number"

vim.keymap.set("n", "<A-w>", ":bd<Cr>", {})

require("lazy").setup("inalone.plugins")

-- Lsp mappings
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<C-s>", vim.lsp.buf.code_action, opts)
	end,
})

-- Telescope mappings
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "view buffers" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "find file" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "find by grep" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "view vim help" })

vim.keymap.set("n", "<leader>ld", builtin.lsp_definitions, { desc = "find definitions" })
vim.keymap.set("n", "<leader>li", builtin.lsp_implementations, { desc = "find implementations" })
vim.keymap.set("n", "<leader>lr", builtin.lsp_references, { desc = "find references" })

-- bufferline
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map("n", "<A-p>", "<Cmd>BufferLineTogglePin<CR>", opts)
map("n", "<A-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", opts)
map("n", "<A-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", opts)
map("n", "<A-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", opts)
map("n", "<A-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", opts)
map("n", "<A-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", opts)
map("n", "<A-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", opts)
map("n", "<A-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", opts)
map("n", "<A-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", opts)
map("n", "<A-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", opts)
map("n", "<A-0>", "<Cmd>BufferLineGoToBuffer 10<CR>", opts)
