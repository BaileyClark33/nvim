local dashboard_width = 90

local function verse_data()
	local cross_icon = "✝️"
	local book_icon = "📖"
	local handle = io.popen("curl -s --max-time 5 https://bible-api.com/data/oeb-us/random")
	local result = handle:read("*a")
	handle:close()

	local max_width = 100

	local ok, data = pcall(vim.fn.json_decode, result)
	if not (ok and data and data.random_verse and data.random_verse.text) then
		local text = cross_icon .. "  Could not fetch verse  " .. cross_icon
		local padding = math.floor((dashboard_width - #text) / 2)
		text = string.rep(" ", padding) .. "    " .. text
		return {
			text,
			width = dashboard_width,
			hl = "SnacksDashboardDesc",
		}
	end

	local verse_text = data.random_verse.text:gsub("\n", " ")
	local reference =
		string.format("%s %d:%d", data.random_verse.book, data.random_verse.chapter, data.random_verse.verse)

	local lines = {}
	local current_line = book_icon .. " " .. reference .. " " .. book_icon .. " " .. "-"

	for word in verse_text:gmatch("%S+") do
		if #current_line + #word > max_width then
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
		local padding = 2
		if #lines >= 2 and #line < max_width then
			padding = math.floor((max_width - #line) / 2)
		end
		local right_padding = padding
		if #line % 2 == 1 then
			right_padding = right_padding - 1
		end
		lines[i] = cross_icon .. string.rep(" ", padding) .. line .. string.rep(" ", right_padding) .. cross_icon
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
							verse_data(),
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
}
