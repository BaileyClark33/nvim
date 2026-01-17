return {
	"NickvanDyke/opencode.nvim",
	dependencies = {
		-- Recommended for `ask()` and `select()`.
		-- Required for `snacks` provider.
		---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
		{ "folke/snacks.nvim" },
	},
	config = function()
		---@type opencode.Opts
		vim.g.opencode_opts = {
			port = nil,
            -- stylua: ignore
            contexts = {
                ["@this"] = function(context) return context:this() end,
                ["@buffer"] = function(context) return context:buffer() end,
                ["@buffers"] = function(context) return context:buffers() end,
                ["@visible"] = function(context) return context:visible_text() end,
                ["@diagnostics"] = function(context) return context:diagnostics() end,
                ["@quickfix"] = function(context) return context:quickfix() end,
                ["@diff"] = function(context) return context:git_diff() end,
                ["@marks"] = function(context) return context:marks() end,
                ["@grapple"] = function(context) return context:grapple_tags() end,
            },
			prompts = {
				ask_append = { prompt = "", ask = true }, -- Handy to insert context mid-prompt. Simpler than exposing every context as a prompt by default.
				ask_this = { prompt = "@this: ", ask = true, submit = true },
				diagnostics = { prompt = "Explain @diagnostics", submit = true },
				diff = {
					prompt = "Review the following git diff for correctness and readability: @diff",
					submit = true,
				},
				document = { prompt = "Add comments documenting @this", submit = true },
				explain = { prompt = "Explain @this and its context", submit = true },
				fix = { prompt = "Fix @diagnostics", submit = true },
				implement = { prompt = "Implement @this", submit = true },
				optimize = { prompt = "Optimize @this for performance and readability", submit = true },
				review = { prompt = "Review @this for correctness and readability", submit = true },
				test = { prompt = "Add tests for @this", submit = true },
			},
			ask = {
				prompt = "Ask opencode: ",
				blink_cmp_sources = { "opencode", "buffer" },
				snacks = {
					icon = "󰚩 ",
					win = {
						title_pos = "left",
						relative = "cursor",
						row = -3, -- Row above the cursor
						col = 0, -- Align with the cursor
					},
				},
			},
			select = {
				prompt = "opencode: ",
				sections = {
					prompts = true,
					commands = {
						["session.new"] = "Start a new session",
						["session.share"] = "Share the current session",
						["session.interrupt"] = "Interrupt the current session",
						["session.compact"] = "Compact the current session (reduce context size)",
						["session.undo"] = "Undo the last action in the current session",
						["session.redo"] = "Redo the last undone action in the current session",
						["agent.cycle"] = "Cycle the selected agent",
						["prompt.submit"] = "Submit the current prompt",
						["prompt.clear"] = "Clear the current prompt",
					},
					provider = true,
				},
				snacks = {
					preview = "preview",
					layout = {
						preset = "vscode",
						hidden = {}, -- preview is hidden by default in `vim.ui.select`
					},
				},
			},
			events = {
				enabled = true,
				reload = true,
				permissions = {
					enabled = true,
					idle_delay_ms = 1000,
				},
			},
			provider = {
				cmd = "opencode --port",
				enabled = vim.tbl_filter(
					---@param provider opencode.Provider
					function(provider)
						return provider.health() == true
					end,
					require("opencode.provider").list()
				)[1].name,
				terminal = {
					split = "right",
					width = math.floor(vim.o.columns * 0.35),
				},
				snacks = {
					auto_close = true, -- Close the terminal when `opencode` exits
					win = {
						position = "right",
						enter = false, -- Stay in the editor after opening the terminal
						wo = {
							winbar = "", -- Title is unnecessary - `opencode` TUI has its own footer
						},
						bo = {
							-- Make it easier to target for customization, and prevent possibly unintended `"snacks_terminal"` targeting.
							-- e.g. the recommended edgy.nvim integration puts all `"snacks_terminal"` windows at the bottom.
							filetype = "opencode_terminal",
						},
					},
				},
				kitty = {
					-- Copy the editor's environment so `opencode` has access to e.g. Mason-installed binaries
					cmd = "--copy-env opencode --port",
					location = "default",
				},
				-- These are wezterm's internal defaults
				wezterm = {
					direction = "bottom",
					top_level = false,
					percent = 50,
				},
				tmux = {
					options = "-h", -- Open in a horizontal split
				},
			},
		}

		-- Required for `opts.events.reload`.
		vim.o.autoread = true

		-- Recommended/example keymaps.
		vim.keymap.set({ "n", "x" }, "<leader>oa", function()
			require("opencode").ask("@this: ", { submit = true })
		end, { desc = "Ask opencode…" })
		vim.keymap.set({ "n", "x" }, "<leader>oe", function()
			require("opencode").select()
		end, { desc = "Execute opencode action…" })
		vim.keymap.set({ "n", "t" }, "<leader>ot", function()
			require("opencode").toggle()
		end, { desc = "Toggle opencode" })

		vim.keymap.set({ "n", "x" }, "<leader>or", function()
			return require("opencode").operator("@this ")
		end, { desc = "Add range to opencode", expr = true })
		vim.keymap.set("n", "<leader>ol", function()
			return require("opencode").operator("@this ") .. "_"
		end, { desc = "Add line to opencode", expr = true })

		vim.keymap.set("n", "<leader>ock", function()
			require("opencode").command("session.half.page.up")
		end, { desc = "Scroll opencode up" })
		vim.keymap.set("n", "<leader>ocj", function()
			require("opencode").command("session.half.page.down")
		end, { desc = "Scroll opencode down" })

		-- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above — otherwise consider "<leader>o…".
		vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
		vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
	end,
}
