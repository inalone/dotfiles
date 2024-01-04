-- return {
-- 	"sainnhe/gruvbox-material",
-- 	name = "gruvbox-material",
-- 	priority = 1000,
-- 
-- 	config = function()
-- 		vim.g.gruvbox_material_background = "hard"
-- 		vim.g.gruvbox_material_better_performance = 1
-- 		vim.g.gruvbox_material_foreground = "mix"
-- 		vim.cmd.colorscheme("gruvbox-material")
-- 	end,
-- }
return { 
	"catppuccin/nvim", 
	name = "catppuccin", 
	priority = 1000,

	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
