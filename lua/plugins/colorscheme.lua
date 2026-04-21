return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = false,
		config = function()
			require("catppuccin").setup({
				styles = {},
				integrations = {
					neotree = true,
					lazy = true,
					mason = true,
					cmp = true,
					opencode = true,
				},
			})
			vim.cmd.colorscheme("catppuccin-macchiato")
		end,
	},
}
