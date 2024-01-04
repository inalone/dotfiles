return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				diagnostics = "nvim_lsp",
			},
		})

		vim.keymap.set('n', '<C-w>', ":bd<Cr>")

		vim.keymap.set('n', '<A-1>', "<Cmd>BufferLineGoToBuffer 1<CR>")
		vim.keymap.set('n', '<A-2>', "<Cmd>BufferLineGoToBuffer 2<CR>")
		vim.keymap.set('n', '<A-3>', "<Cmd>BufferLineGoToBuffer 3<CR>")
		vim.keymap.set('n', '<A-4>', "<Cmd>BufferLineGoToBuffer 4<CR>")
		vim.keymap.set('n', '<A-5>', "<Cmd>BufferLineGoToBuffer 5<CR>")
		vim.keymap.set('n', '<A-6>', "<Cmd>BufferLineGoToBuffer 6<CR>")
		vim.keymap.set('n', '<A-7>', "<Cmd>BufferLineGoToBuffer 7<CR>")
		vim.keymap.set('n', '<A-8>', "<Cmd>BufferLineGoToBuffer 8<CR>")
		vim.keymap.set('n', '<A-9>', "<Cmd>BufferLineGoToBuffer 9<CR>")
		vim.keymap.set('n', '<A-0>', "<Cmd>BufferLineGoToBuffer 10<CR>")
	end,
}
