return {
	{
		"zaldih/themery.nvim",
		lazy = false,
		config = function()
			require("themery").setup({
				-- Your list of installed colorschemes.
				themes = {
					"gruvbox",
					"tokyonight",
					"rose-pine",
					"nightfox",
					"onedark",
					"vscode",
					"cyberdream",
					"miasma",
					"bluloco",
					"oldworld",
					"hybrid",
					"moonlight",
					"arctic",
					"citruszest",
					"NeoSolarized",
					"neon",
					"monokai-nightasty",
					"aurora",
					"nightfall",
					"one_monokai",
				},
				livePreview = true, -- Apply theme while picking. Default to true.
				globalAfter = [[
                                vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
                                vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
                                vim.api.nvim_set_hl(0, "LineNr", { fg = "#888888", bg = "none" })
                                vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#aaaaaa", bg = "none", bold = true })
                                vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
                              ]],
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
		"xero/miasma.nvim",
		branch = "dev",
		dependencies = {
			"rktjmp/lush.nvim",
			"rktjmp/shipwright.nvim",
		},
		lazy = false,
		priority = 1000,
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
		"dgox16/oldworld.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"HoNamDuong/hybrid.nvim",
		lazy = false,
		priority = 1000,
		opts = { transparent = true },
	},
	{
		"shaunsingh/moonlight.nvim",
		config = function()
			vim.g.moonlight_disable_background = true
		end,
	},
	{
		"rockyzhang24/arctic.nvim",
		dependencies = { "rktjmp/lush.nvim" },
		name = "arctic",
		branch = "main",
		priority = 1000,
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
		"rafamadriz/neon",
		config = function()
			vim.g.neon_italic_keyword = false
			vim.g.neon_italic_function = false
			vim.g.neon_transparent = true
		end,
	},
	{
		"polirritmico/monokai-nightasty.nvim",
		lazy = false,
		priority = 1000,
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
		"2giosangmitom/nightfall.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"cpea2506/one_monokai.nvim",
		config = function()
			require("one_monokai").setup({
				transparent = true,
			})
		end,
	},
}
