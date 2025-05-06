return {
	{
		"zaldih/themery.nvim",
		lazy = false,
		config = function()
			require("themery").setup({
				-- Your list of installed colorschemes.
				themes = {
					"gruvbox",
					"citruszest",
					"cyberdream",
					"NeoSolarized",
					"miasma",
					"rose-pine",
					"one_monokai",
					"aurora",
					"tokyonight",
					"nightfox",
					"onedark",
					"vscode",
					"bluloco",
					"hybrid",
				},
				livePreview = true, -- Apply theme while picking. Default to true.
			})
			vim.keymap.set("n", "<leader>cs", ":Themery<CR>")
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				transparent_mode = true,
				italic = {
					strings = false,
					emphasis = true,
					comments = true,
					operators = false,
					folds = true,
				},
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = { transparent = true },
	},
	-- lua/plugins/rose-pine.lua
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				styles = { italic = false, transparency = true },
			})
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		config = function()
			require("nightfox").setup({
				options = { transparent = true },
			})
		end,
	}, -- lazy
	-- Using Lazy
	{
		"navarasu/onedark.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("onedark").setup({
				style = "darker",
				transparent = true,
			})
		end,
	},
	{
		"Mofiqul/vscode.nvim",
		config = function()
			require("vscode").setup({
				transparent = true,
			})
		end,
	},
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("cyberdream").setup({
				transparent = true,
			})
		end,
	},
	{
		"uloco/bluloco.nvim",
		lazy = false,
		priority = 1000,
		dependencies = { "rktjmp/lush.nvim" },
		config = function()
			require("bluloco").setup({
				transparent = true,
				guicursor = false,
			})
		end,
	},
	{
		"HoNamDuong/hybrid.nvim",
		lazy = false,
		priority = 1000,
		opts = { transparent = true },
	},
	{
		"zootedb0t/citruszest.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("citruszest").setup({
				option = {
					transparent = true, -- Enable/Disable transparency
				},
			})
		end,
	},
	{
		"Tsuzat/NeoSolarized.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
	},
	{
		"ray-x/aurora",
		init = function()
			vim.g.aurora_italic = 1
			vim.g.aurora_transparent = 1
			vim.g.aurora_bold = 1
		end,
		config = function()
			vim.api.nvim_set_hl(0, "@number", { fg = "#e933e3" })
		end,
	},
	{
		"cpea2506/one_monokai.nvim",
		config = function()
			require("one_monokai").setup({
				transparent = true,
			})
		end,
	},
	{
		"xero/miasma.nvim",
		lazy = false,
		priority = 1000,
	},
}
