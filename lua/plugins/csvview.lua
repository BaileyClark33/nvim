return {
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
}
