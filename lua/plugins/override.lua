return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"saghen/blink.compat",
		},
		specs = { "Kaiser-Yang/blink-cmp-avante" },
		opts = {
			sources = {
				default = { "avante" },
				providers = { avante = { module = "blink-cmp-avante", name = "Avante" } },
			},
			cmdline = {
				keymap = { preset = "inherit" },
				completion = { menu = { auto_show = true } },
			},
			keymap = {
				preset = "enter",
				["<M-i>"] = { "accept" },
				["<M-p>"] = { "select_prev" },
				["<M-n>"] = { "select_next" },
			},
		},
	},
	{
		"stevearc/aerial.nvim",
		opts = {
			layout = {
				resize_to_content = true,
			},
			filter_kind = false,
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				-- configuration for all lsp servers
				["*"] = {
					keys = {
						{ "<leader>cl", false, mode = { "n", "x", "v" } },
						{
							"<leader>cL",
							function()
								Snacks.picker.lsp_config()
							end,
							desc = "Lsp Info",
							mode = { "n" },
						},
					},
				},
			},
		},
	},
	{
		"gbprod/yanky.nvim",
		keys = {
			{ "<leader>p", false, mode = { "n", "x", "v" } },
			{
				"<leader>P",
				function()
					if LazyVim.pick.picker.name == "telescope" then
						require("telescope").extensions.yank_history.yank_history({})
					elseif LazyVim.pick.picker.name == "snacks" then
						Snacks.picker.yanky()
					else
						vim.cmd([[YankyRingHistory]])
					end
				end,
				mode = { "n", "x", "v" },
				desc = "Open Yank History",
			},
		},
	},
}
