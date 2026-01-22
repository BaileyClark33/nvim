-- Standalone plugins with less than 10 lines of config go here
return {
	{
		{
			"tpope/vim-dadbod",
			dependencies = {
				"kristijanhusak/vim-dadbod-ui",
				"kristijanhusak/vim-dadbod-completion",
			},
			config = function()
				-- Set up dadbod-ui
				vim.g.db_ui_use_nerd_fonts = 1
				vim.g.db_ui_show_database_icon = 1

				-- Auto-completion setup
				vim.api.nvim_create_autocmd("FileType", {
					pattern = { "sql", "mysql", "plsql" },
					callback = function()
						require("cmp").setup.buffer({
							sources = {
								{ name = "vim-dadbod-completion" },
								{ name = "buffer" },
							},
						})
					end,
				})
			end,
			keys = {
				{ "<leader>Db", "<cmd>DBUIToggle<cr>", desc = "Toggle DBUI" },
				{ "<leader>Df", "<cmd>DBUIFindBuffer<cr>", desc = "Find DB Buffer" },
				{ "<leader>Dr", "<cmd>DBUIRenameBuffer<cr>", desc = "Rename DB Buffer" },
				{ "<leader>Dl", "<cmd>DBUILastQueryInfo<cr>", desc = "Last Query Info" },
			},
		},
	},
	{
		"rest-nvim/rest.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			opts = function(_, opts)
				opts.ensure_installed = opts.ensure_installed or {}
				table.insert(opts.ensure_installed, "http")
			end,
		},
	},
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
			vim.keymap.set("n", "<leader>U", vim.cmd.UndotreeToggle, { desc = "Undotree" })
		end,
	},
}
