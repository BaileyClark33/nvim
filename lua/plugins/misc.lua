-- Standalone plugins with less than 10 lines of config go here
return {
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
			"TmuxNavigatorProcessList",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
	{
		"hat0uma/csvview.nvim",
		ft = { "csv" },
		opts = {
			keymaps = {
				jump_next_field_end = { "<Enter>", mode = { "n", "v" } },
				jump_prev_field_end = { "<Tab>", mode = { "n", "v" } },
				jump_next_row = { "<S-Enter>", mode = { "n", "v" } },
				jump_prev_row = { "<S-Tab>", mode = { "n", "v" } },
			},
			view = {
				display_mode = "border",
			},
		},
		cmd = { "CsvViewToggle", "CsvViewEnable", "CsvViewDisable" },
		config = function(_, opts)
			require("csvview").setup(opts)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "csv",
				callback = function()
					vim.cmd("CsvViewEnable")
				end,
			})
		end,
	},
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>U", vim.cmd.UndotreeToggle)
		end,
	},
}
