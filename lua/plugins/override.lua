return {
	{
		"folke/sidekick.nvim",
		keys = {
			{
				"<A-i>",
				function()
					-- if there is a next edit, jump to it, otherwise apply it if any
					if not require("sidekick").nes_jump_or_apply() then
						return "<Tab>" -- fallback to normal tab
					end
				end,
				expr = true,
				desc = "Goto/Apply Next Edit Suggestion",
			},
			{
				"<A-t>",
				function()
					require("sidekick.cli").toggle()
				end,
				desc = "Sidekick Toggle",
				mode = { "n", "t", "i", "x" },
			},
			{
				"<leader>ac",
				function()
					require("sidekick.cli").toggle({ name = "copilot", focus = true })
				end,
				desc = "Sidekick Toggle Copilot",
			},
		},
	},
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
	{
		"folke/snacks.nvim",
		optional = true,
		opts = {
			picker = {
				actions = {
					sidekick_send = function(...)
						return require("sidekick.cli.picker.snacks").send(...)
					end,
				},
				win = {
					input = {
						keys = {
							["<a-a>"] = {
								"sidekick_send",
								mode = { "n", "i" },
							},
						},
					},
				},
			},
		},
	},
}
