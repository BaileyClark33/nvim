return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
		"jayp0521/mason-null-ls.nvim", -- ensure dependencies are installed
	},
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting -- to setup formatters
		local diagnostics = null_ls.builtins.diagnostics -- to setup linters

		-- Formatters & linters for mason to install
		require("mason-null-ls").setup({
			ensure_installed = {
				"prettier", -- ts/js formatter
				"stylua", -- lua formatter
				"eslint_d", -- ts/js linter
				"shfmt", -- Shell formatter
				"checkmake", -- linter for Makefiles
				"ruff", -- Python linter and formatter
			},
			automatic_installation = true,
		})

		-- Ruff, Isort Line Length Setting
		local line_length = "114"

		local sources = {
			diagnostics.checkmake,
			-- setup lua formatter
			formatting.stylua,
			-- setup eslint linter for javascript
			require("none-ls.diagnostics.eslint_d"),
			-- setup prettier to format languages that are not lua
			formatting.prettier.with({ filetypes = { "html", "json", "yaml", "markdown" } }),

			formatting.shfmt.with({ args = { "-i", "4" } }),
			formatting.terraform_fmt,

			-- Python formatter and linter setup
			require("none-ls.formatting.ruff").with({
				extra_args = { "--line-length", line_length, "--profile", "black", "--fix-imports" },
			}),
			require("none-ls.formatting.ruff_format"),

			-- Add  to format Java files
		}

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			-- debug = true, -- Enable debug mode. Inspect logs with :NullLsLog.
			sources = sources,
			-- you can reuse a shared lspconfig on_attach callback here
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,
		})

		vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "[C]ode [F]ormat" })
	end,
}
