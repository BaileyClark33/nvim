return {
	"mfussenegger/nvim-jdtls",
	ft = { "java" },
	config = function()
		local jdtls = require("jdtls")

		local home = vim.fn.expand("~")
		local java_path = "/usr/lib/jvm/java-21-openjdk-amd64/bin/java"
		local jdtls_path = home .. "/.local/share/nvim/mason/packages/jdtls"
		local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
		local workspace_dir = home .. "/.cache/jdtls/workspace/" .. project_name

		local config = {
			cmd = {
				java_path,
				"-Declipse.application=org.eclipse.jdt.ls.core.id1",
				"-Dosgi.bundles.defaultStartLevel=4",
				"-Declipse.product=org.eclipse.jdt.ls.core.product",
				"-Dlog.protocol=true",
				"-Dlog.level=ALL",
				"-Xms1g",
				"--add-modules=ALL-SYSTEM",
				"--add-opens",
				"java.base/java.util=ALL-UNNAMED",
				"--add-opens",
				"java.base/java.lang=ALL-UNNAMED",
				"-jar",
				vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
				"-configuration",
				jdtls_path .. "/config_linux",
				"-data",
				workspace_dir,
			},
			root_dir = vim.fs.dirname(vim.fs.find({ ".git", "mvnw", "gradlew" }, { upward = true })[1]),
		}

		jdtls.start_or_attach(config)
	end,
}
