return {
	"hat0uma/csvview.nvim",
	ft = { "csv" },
	opts = {
		keymaps = {
			jump_next_field_end = { "l", mode = { "n", "v" } },
			jump_prev_field_end = { "h", mode = { "n", "v" } },
			jump_next_row = { "j", mode = { "n", "v" } },
			jump_prev_row = { "k", mode = { "n", "v" } },
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
}
