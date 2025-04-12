return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = true,
					emphasis = true,
					comments = true,
					operators = false,
					folds = true,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = true,
			})
			vim.cmd("colorscheme gruvbox")
		end,
	},
}

--[[
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "mocha",
					dark = "mocha",
				},
				transparent_background = true, -- disables setting the background color.
				show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
				term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
				dim_inactive = {
					enabled = false, -- dims the background color of inactive window
					shade = "dark",
					percentage = 0.15, -- percentage of the shade to apply to the inactive window
				},
				no_italic = false, -- Force no italic
				no_bold = false, -- Force no bold
				no_underline = false, -- Force no underline
				styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
					comments = { "italic" }, -- Change the style of comments
					conditionals = { "italic" },
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
					-- miscs = {}, -- Uncomment to turn off hard-coded styles
				},
				color_overrides = {
					all = {
						{
							-- this 16 colors are changed to onedark
							base = "#282c34",
							mantle = "#353b45",
							surface0 = "#3e4451",
							surface1 = "#545862",
							surface2 = "#565c64",
							text = "#abb2bf",
							rosewater = "#b6bdca",
							lavender = "#c8ccd4",
							red = "#e06c75",
							peach = "#d19a66",
							yellow = "#e5c07b",
							green = "#98c379",
							teal = "#56b6c2",
							blue = "#61afef",
							mauve = "#c678dd",
							flamingo = "#be5046",

							-- now patching extra palettes
							maroon = "#e06c75",
							sky = "#d19a66",

							-- extra colors not decided what to do
							pink = "#F5C2E7",
							sapphire = "#74C7EC",

							subtext1 = "#BAC2DE",
							subtext0 = "#A6ADC8",
							overlay2 = "#9399B2",
							overlay1 = "#7F849C",
							overlay0 = "#6C7086",

							crust = "#11111B",
						},
					},
					latte = {
						--base = "#ff0000",
						--mantle = "#242424",
						--crust = "#474747",
					},
					frappe = {},
					macchiato = {},
					mocha = {},
				},
				custom_highlights = {},
				default_integrations = true,
				integrations = {
					cmp = true,
					gitsigns = false,
					nvimtree = true,
					treesitter = true,
					notify = false,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
					-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
				},
			})

			-- setup must be called before loading
			vim.cmd.colorscheme("catppuccin")
		end,
	},
]]
--

-- "shaunsingh/nord.nvim",
-- lazy = false,
-- priority = 1000,
-- config = function()
-- vim.g.nord_contrast = true
-- vim.g.nord_borders = false
-- vim.g.nord_disable_background = true
-- vim.g.nord_italic = false
-- vim.g.nord_uniform_diff_background = false
-- vim.g.nord_bold = false
-- require("nord").set()
-- end,

--[[
	"EdenEast/nightfox.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		-- Default options
		require("nightfox").setup({
			options = {
				-- Compiled file's destination location
				compile_path = vim.fn.stdpath("cache") .. "/nightfox",
				compile_file_suffix = "_compiled", -- Compiled file suffix
				transparent = true, -- Disable setting background
				terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
				dim_inactive = false, -- Non focused panes set to alternative background
				module_default = true, -- Default enable value for modules
				colorblind = {
					enable = false, -- Enable colorblind support
					simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
					severity = {
						protan = 0, -- Severity [0,1] for protan (red)
						deutan = 0, -- Severity [0,1] for deutan (green)
						tritan = 0, -- Severity [0,1] for tritan (blue)
					},
				},
				styles = { -- Style to be applied to different syntax groups
					comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
					conditionals = "NONE",
					constants = "NONE",
					functions = "NONE",
					keywords = "NONE",
					numbers = "NONE",
					operators = "NONE",
					strings = "NONE",
					types = "NONE",
					variables = "NONE",
				},
				inverse = { -- Inverse highlight for different types
					match_paren = false,
					visual = false,
					search = false,
				},
				modules = { -- List of various plugins and additional options
					-- ...
				},
			},
			palettes = {},
			specs = {},
			groups = {},
		})

		-- setup must be called before loading
		vim.cmd("colorscheme nightfox")
	end,
    ]]
--
