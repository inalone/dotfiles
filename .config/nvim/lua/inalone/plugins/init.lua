return {
	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.o.termguicolors = true
			require('onedark').load()
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				toggler = {
					line = "co",
				},
				opleader = {
					block = "co",
				},
			})
		end,
	},
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"neovim/nvim-lspconfig",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "buffer" },
					{ name = "luasnip" },
					{ name = "nvim_lsp" },
					{ name = "path" },
				}),
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lsp = require("lspconfig")

			lsp.clangd.setup({})
			lsp.cssls.setup({})
			lsp.html.setup({})
			lsp.jsonls.setup({})
			lsp.rust_analyzer.setup({})
			lsp.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
						},
						telemetry = {
							enable = false,
						},
					},
				},
			})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		config = function(_)
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<esc>"] = require("telescope.actions").close,
						},
					},
				},
			})
			require("telescope").load_extension("fzf")
		end,
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function(_)
			require("bufferline").setup({})
		end,
	},
	{
		"tpope/vim-fugitive",
	},
	{
		"windwp/nvim-autopairs",
	},
}