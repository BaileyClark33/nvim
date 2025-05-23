local home = os.getenv("HOME")
local workspace_path = home .. "/.local/share/nvim/jdtls-workspace/"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = workspace_path .. project_name

local status, jdtls = pcall(require, "jdtls")
if not status then
	return
end
local extendedClientCapabilities = jdtls.extendedClientCapabilities

local config = {
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
		"-jar",
		vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
		"-configuration",
		home .. "/.local/share/nvim/mason/packages/jdtls/config_linux",
		"-data",
		workspace_dir,
	},
	root_dir = require("jdtls.setup").find_root({ "gradlew", "pom.xml", "build.gradle", ".git", "mvnw" }),

	settings = {
		java = {
			signatureHelp = { enabled = true },
			extendedClientCapabilities = extendedClientCapabilities,
			maven = {
				downloadSources = true,
			},
			referencesCodeLens = {
				enabled = true,
			},
			references = {
				includeDecompiledSources = true,
			},
			inlayHints = {
				parameterNames = {
					enabled = "all", -- literals, all, none
				},
			},
			format = {
				enabled = false,
			},
		},
	},

	init_options = {
		bundles = {},
	},
}
require("jdtls").start_or_attach(config)

-- Set a Vim motion to <Space> + <Shift>J + o to organize imports in normal mode
vim.keymap.set(
	"n",
	"<leader>Jo",
	"<Cmd> lua require('jdtls').organize_imports()<CR>",
	{ desc = "[J]ava [O]rganize Imports" }
)
-- Set a Vim motion to <Space> + <Shift>J + v to extract the code under the cursor to a variable
vim.keymap.set(
	"n",
	"<leader>Jv",
	"<Cmd> lua require('jdtls').extract_variable()<CR>",
	{ desc = "[J]ava Extract [V]ariable" }
)
-- Set a Vim motion to <Space> + <Shift>J + v to extract the code selected in visual mode to a variable
vim.keymap.set(
	"v",
	"<leader>Jv",
	"<Esc><Cmd> lua require('jdtls').extract_variable(true)<CR>",
	{ desc = "[J]ava Extract [V]ariable" }
)
-- Set a Vim motion to <Space> + <Shift>J + <Shift>C to extract the code under the cursor to a static variable
vim.keymap.set(
	"n",
	"<leader>JC",
	"<Cmd> lua require('jdtls').extract_constant()<CR>",
	{ desc = "[J]ava Extract [C]onstant" }
)
-- Set a Vim motion to <Space> + <Shift>J + <Shift>C to extract the code selected in visual mode to a static variable
vim.keymap.set(
	"v",
	"<leader>JC",
	"<Esc><Cmd> lua require('jdtls').extract_constant(true)<CR>",
	{ desc = "[J]ava Extract [C]onstant" }
)
-- Set a Vim motion to <Space> + <Shift>J + t to run the test method currently under the cursor
vim.keymap.set(
	"n",
	"<leader>Jt",
	"<Cmd> lua require('jdtls').test_nearest_method()<CR>",
	{ desc = "[J]ava [T]est Method" }
)
-- Set a Vim motion to <Space> + <Shift>J + t to run the test method that is currently selected in visual mode
vim.keymap.set(
	"v",
	"<leader>Jt",
	"<Esc><Cmd> lua require('jdtls').test_nearest_method(true)<CR>",
	{ desc = "[J]ava [T]est Method" }
)
-- Set a Vim motion to <Space> + <Shift>J + <Shift>T to run an entire test suite (class)
vim.keymap.set("n", "<leader>JT", "<Cmd> lua require('jdtls').test_class()<CR>", { desc = "[J]ava [T]est Class" })
-- Set a Vim motion to <Space> + <Shift>J + u to update the project configuration
vim.keymap.set("n", "<leader>Ju", "<Cmd> JdtUpdateConfig<CR>", { desc = "[J]ava [U]pdate Config" })
