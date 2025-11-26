return {
	{
		"snacks.nvim",
		opts = {
			indent = { enabled = false },
			scroll = { enabled = false },
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
}
