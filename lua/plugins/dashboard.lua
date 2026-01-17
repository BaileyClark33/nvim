local dashboard_width = 80
local chars_length = vim.fn.strchars

local function verse_data()
	local cross_icon = "✝️"
	local book_icon = "📖"
	local icon_width = 2
	local handle = io.popen("curl -s --max-time 5 https://bible-api.com/data/oeb-us/random")
	local result = handle:read("*a")
	handle:close()

	local max_width = 90

	local ok, data = pcall(vim.fn.json_decode, result)
	if not (ok and data and data.random_verse and data.random_verse.text) then
		-- if true then
		local message = "  Jesus is King  "
		local text = cross_icon .. message .. cross_icon
		local text_length = icon_width * 2 + chars_length(message)
		local padding = math.floor((dashboard_width - text_length) / 2)
		text = string.rep(" ", padding) .. text
		return {
			text,
			width = chars_length(text),
			hl = "SnacksDashboardDesc",
		}
	end

	local verse_text = data.random_verse.text:gsub("\n", " "):sub(1, -2)

	local reference =
		string.format("%s %d:%d", data.random_verse.book, data.random_verse.chapter, data.random_verse.verse)

	local lines = {}
	local title_line = book_icon .. " " .. reference .. " " .. book_icon
	local title_length = chars_length(reference) + 2 + (2 * icon_width)
	if title_length % 2 == 0 then
		title_line = title_line .. " "
		title_length = title_length + 1
	end
	table.insert(lines, title_line)

	local current_line = ""
	local verse_width = title_length
	for word in verse_text:gmatch("%S+") do
		if chars_length(current_line) + chars_length(word) > max_width then
			current_line = current_line:sub(1, -2)
			if chars_length(current_line) % 2 == 0 then
				current_line = current_line .. " "
			end
			if chars_length(current_line) > verse_width then
				verse_width = chars_length(current_line)
			end
			table.insert(lines, current_line)
			current_line = word .. " "
		else
			current_line = current_line .. word .. " "
		end
	end
	current_line = current_line:sub(1, -2)
	if chars_length(current_line) % 2 == 0 then
		current_line = current_line .. " "
	end
	if chars_length(current_line) > verse_width then
		verse_width = chars_length(current_line)
	end
	table.insert(lines, current_line)
	verse_width = verse_width + 4

	local outside_padding = math.floor((max_width - verse_width) / 2)
	if outside_padding < 0 then
		outside_padding = 0
	end
	for i, line in ipairs(lines) do
		local diff = 0
		if i == 1 then
			diff = verse_width - title_length
		else
			diff = verse_width - chars_length(line)
		end
		local padding = math.floor(diff / 2)
		lines[i] = string.rep(" ", outside_padding)
			.. cross_icon
			.. string.rep(" ", padding)
			.. line
			.. string.rep(" ", padding)
			.. cross_icon
	end

	return {
		table.concat(lines, "\n"),
		width = max_width,
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
            ████████╗ █████╗  ██████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗          Z
            ╚══██╔══╝██╔══██╗██╔════╝██╔═══██╗██║   ██║██║████╗ ████║      Z    
               ██║   ███████║██║     ██║   ██║██║   ██║██║██╔████╔██║   z       
               ██║   ██╔══██║██║     ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ z         
               ██║   ██║  ██║╚██████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║           
               ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝           
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
