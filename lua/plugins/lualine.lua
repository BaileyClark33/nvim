return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local mode = {
				"mode",
				fmt = function(str)
					return " " .. str
					-- return ' ' .. str:sub(1, 1) -- displays only the first character of the mode
				end,
			}

			local filename = {
				"filename",
				file_status = false, -- displays file status (readonly status, modified status)
				path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
			}

			local hide_in_width = function()
				return vim.fn.winwidth(0) > 100
			end

			local diagnostics = {
				"diagnostics",
				sources = { "nvim_diagnostic" },
				sections = { "error", "warn" },
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
				colored = false,
				update_in_insert = false,
				always_visible = false,
				cond = hide_in_width,
			}

			local diff = {
				"diff",
				colored = false,
				symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
				cond = hide_in_width,
			}

			local colors = {
				black = "#000000",
				white = "#edecec",
				red = "#8b0000",
				brightred = "#e00000",
				shadedred = "#230000",
				gray = "#b4b4b4",
				darkgray = "#2e2d2d",
			}

			local tacocat = {
				normal = {
					a = { bg = colors.red, fg = colors.black, gui = "bold" },
					b = { bg = colors.darkgray, fg = colors.gray },
					c = { bg = colors.shadedred, fg = colors.brightred },
				},
				insert = {
					a = { bg = colors.red, fg = colors.black, gui = "bold" },
					b = { bg = colors.darkgray, fg = colors.gray },
					c = { bg = colors.shadedred, fg = colors.brightred },
				},
				visual = {
					a = { bg = colors.red, fg = colors.black, gui = "bold" },
					b = { bg = colors.darkgray, fg = colors.gray },
					c = { bg = colors.shadedred, fg = colors.brightred },
				},
				replace = {
					a = { bg = colors.red, fg = colors.black, gui = "bold" },
					b = { bg = colors.darkgray, fg = colors.gray },
					c = { bg = colors.shadedred, fg = colors.brightred },
				},
				command = {
					a = { bg = colors.red, fg = colors.black, gui = "bold" },
					b = { bg = colors.darkgray, fg = colors.gray },
					c = { bg = colors.shadedred, fg = colors.brightred },
				},
				inactive = {
					a = { bg = colors.red, fg = colors.black, gui = "bold" },
					b = { bg = colors.darkgray, fg = colors.gray },
					c = { bg = colors.shadedred, fg = colors.brightred },
				},
			}

			local tabs = {
				"tabs",
				tab_max_length = 40, -- Maximum width of each tab. The content will be shorten dynamically (example: apple/orange -> a/orange)
				max_length = vim.o.columns, -- Maximum width of tabs component.
				-- Note:
				-- It can also be a function that returns
				-- the value of `max_length` dynamically.
				mode = 1, -- 0: Shows tab_nr
				-- 1: Shows tab_name
				-- 2: Shows tab_nr + tab_name

				path = 1, -- 0: just shows the filename
				-- 1: shows the relative path and shorten $HOME to ~
				-- 2: shows the full path
				-- 3: shows the full path and shorten $HOME to ~

				-- Automatically updates active tab color to match color of other components (will be overidden if buffers_color is set)
				use_mode_colors = false,

				show_modified_status = false, -- Shows a symbol next to the tab name if the file has been modified.
				symbols = {
					modified = "[+]", -- Text to show when the file is modified.
				},
			}
			local name = {
				"filename",
				file_status = false, -- Displays file status (readonly status, modified status)
				newfile_status = false, -- Display new file status (new file means no write after created)
				path = 0, -- 0: Just the filename
				-- 1: Relative path
				-- 2: Absolute path
				-- 3: Absolute path, with tilde as the home directory
				-- 4: Filename and parent dir, with tilde as the home directory

				shorting_target = 40, -- Shortens path to leave 40 spaces in the window
				-- for other components. (terrible name, any suggestions?)
				symbols = {
					modified = "[+]", -- Text to show when the file is modified.
					readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
					unnamed = "[No Name]", -- Text to show for unnamed buffers.
					newfile = "[New]", -- Text to show for newly created file before first write
				},
			}

			local icons = {
				Error = { " ", "DiagnosticError" },
				Inactive = { " ", "MsgArea" },
				Warning = { " ", "DiagnosticWarn" },
				Normal = { LazyVim.config.icons.kinds.Copilot, "Special" },
			}

			local sidekick_icon = {
				function()
					local status = require("sidekick.status").get()
					return status and vim.tbl_get(icons, status.kind, 1)
				end,
				cond = function()
					return require("sidekick.status").get() ~= nil
				end,
				color = function()
					local status = require("sidekick.status").get()
					local hl = status and (status.busy and "DiagnosticWarn" or vim.tbl_get(icons, status.kind, 2))
					return { fg = Snacks.util.color(hl) }
				end,
			}

			local sidekick_cli = {
				function()
					local status = require("sidekick.status").cli()
					return " " .. (#status > 1 and #status or "")
				end,
				cond = function()
					return #require("sidekick.status").cli() > 0
				end,
				color = function()
					return { fg = Snacks.util.color("Special") }
				end,
			}

			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = tacocat, -- Set theme based on environment variable
					-- Some useful glyphs:
					-- https://www.nerdfonts.com/cheat-sheet
					--        
					component_separators = { left = " ", right = " " },
					section_separators = { left = "", right = "" },
					disabled_filetypes = { "netrw", "neo-tree" },
					always_divide_middle = true,
				},
				sections = {
					lualine_a = { mode },
					lualine_b = { "branch" },
					lualine_c = { { "filetype", icon_only = true }, tabs },
					lualine_x = { diagnostics, diff, "fileformat" },
					lualine_y = { name },
					lualine_z = { sidekick_icon, sidekick_cli, "progress" },
				},
				inactive_sections = {
					lualine_a = { mode },
					lualine_c = { { "filetype", icon_only = true }, tabs },
					lualine_y = { name },
					lualine_z = { sidekick_icon, sidekick_cli, "progress" },
				},
				extensions = { "fugitive" },
			})
		end,
	},

