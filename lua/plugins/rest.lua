return {
	"rest-nvim/rest.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			table.insert(opts.ensure_installed, "http")
		end,
	},
	config = function()
		vim.g.rest_nvim = {
			result_split_horizontal = false,
			result_split_in_place = false,
			skip_ssl_verification = false,
			highlight = {
				enabled = true,
				timeout = 150,
			},
			result = {
				show_url = true,
				show_http_info = true,
				show_headers = true,
			},
			jump_to_request = false,
			env_file = ".env",
			custom_dynamic_variables = {},
			yank_dry_run = true,
		}

		-- Keymaps
		vim.keymap.set("n", "<leader>rr", "<Plug>RestNvim", { desc = "Run request under cursor" })
		vim.keymap.set("n", "<leader>rp", "<Plug>RestNvimPreview", { desc = "Preview request" })
		vim.keymap.set("n", "<leader>rl", "<Plug>RestNvimLast", { desc = "Re-run last request" })
	end,
}
