local dashboard_width = 90

local function verse_data()
	local handle = io.popen("curl -s --max-time 5 https://bible-api.com/data/oeb-us/random")
	local result = handle:read("*a")
	handle:close()

	local max_width = 170
	local offset = 10
	local min_width = dashboard_width - offset / 2

	local ok, data = pcall(vim.fn.json_decode, result)
	if not (ok and data and data.random_verse and data.random_verse.text) then
		local text = "Could not fetch verse."
		local padding = math.floor((min_width - #text) / 2)
		text = string.rep(" ", padding) .. text
		return {
			text,
			width = min_width,
			hl = "SnacksDashboardDesc",
		}
	end

	local verse_text = data.random_verse.text:gsub("\n", " ")
	local reference =
		string.format("%s %d:%d", data.random_verse.book, data.random_verse.chapter, data.random_verse.verse)

	local lines = {}
	local current_line = reference .. " -"

	for word in verse_text:gmatch("%S+") do
		if #current_line + #word + offset > max_width then
			table.insert(lines, current_line)
			current_line = word
		else
			current_line = current_line .. " " .. word
		end
	end
	table.insert(lines, current_line)

	local verse_width = 0
	for _, line in ipairs(lines) do
		verse_width = math.max(verse_width, #line)
	end

	for i, line in ipairs(lines) do
		if #lines == 1 and #line < min_width then
			local padding = math.floor((min_width - #line) / 2)
			lines[i] = string.rep(" ", padding) .. line
		elseif #lines == 2 then
			local padding = math.floor((max_width - #line - offset) / 2)
			lines[i] = string.rep(" ", padding) .. line
		else
			lines[i] = "  " .. line .. "  "
		end
	end

	return {
		table.concat(lines, "\n"),
		width = verse_width,
		hl = "SnacksDashboardDesc",
	}
end

return {
	{
		"snacks.nvim",
		opts = {
			indent = { enabled = false },
			scroll = { enabled = false },
			dashboard = {
				width = dashboard_width,
				preset = {
					header = [[
           ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗          Z
           ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║      Z    
           ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║   z       
           ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ z         
           ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║           
           ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝           
]],
				},

				sections = {
					{ section = "header" },
					{
						title = "Verse",
						text = {
							{ "✝️ ", hl = "SnacksDashboardIcon" },
							verse_data(),
							{ "📖", hl = "SnacksDashboardKey" },
						},
						indent = 2,
						padding = 3,
					},
					{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
					{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
					{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
					{ section = "startup" },
				},
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
}
