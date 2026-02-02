return {
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
					require("cmp").setup.buffer()
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
}
