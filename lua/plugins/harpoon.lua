return {
	"ThePrimeagen/harpoon",
	config = function()
		require("harpoon").setup({
			menu = {
				width = 70,
				height = 10,
			},
		})

		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "Harpoon Add" })
		vim.keymap.set("n", "<A-r>", ui.toggle_quick_menu)

		vim.keymap.set("n", "<A-a>", function()
			ui.nav_file(1)
		end)
		vim.keymap.set("n", "<A-s>", function()
			ui.nav_file(2)
		end)
		vim.keymap.set("n", "<A-d>", function()
			ui.nav_file(3)
		end)
		vim.keymap.set("n", "<A-f>", function()
			ui.nav_file(4)
		end)
		vim.keymap.set("n", "<A-g>", function()
			ui.nav_file(5)
		end)
	end,
}
