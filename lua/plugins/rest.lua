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
		vim.keymap.set("n", "<leader>ro", "<cmd>Rest open<CR>", { desc = "Rest Open" })
		vim.keymap.set("n", "<leader>rr", "<cmd>Rest run<CR>", { desc = "Rest Run" })
		vim.keymap.set("n", "<leader>rl", "<cmd>Rest last<CR>", { desc = "Rest Run Last Request" })
		vim.keymap.set("n", "<leader>rL", "<cmd>Rest logs<CR>", { desc = "Rest Logs" })
		vim.keymap.set("n", "<leader>rc", "<cmd>Rest cookies<CR>", { desc = "Rest Cookies" })
		vim.keymap.set("n", "<leader>ree", "<cmd>Rest env show<CR>", { desc = "Rest env Show" })
		vim.keymap.set("n", "<leader>res", "<cmd>Rest env select<CR>", { desc = "Rest env Select" })
		vim.keymap.set("n", "<leader>rsp", ":Rest env set ", { desc = "Rest env Set {Path}" })
	end,
}
