vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("n", "<leader>lz", ":Lazy<CR>")

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

--oil and file explorer
vim.keymap.set("n", "-", "<cmd>Oil<CR>")
vim.keymap.set("n", "<leader>fd", vim.cmd.Ex, { desc = "[F]ind [D]irectories" })

vim.keymap.set("n", "<leader>bg", function()
	local hl = vim.api.nvim_set_hl
	hl(0, "Normal", { bg = "none" })
	hl(0, "NormalNC", { bg = "none" })
	hl(0, "SignColumn", { bg = "none" })
	hl(0, "LineNr", { fg = "#a3a3a3", bg = "none" })
	hl(0, "NormalFloat", { bg = "none" })
	hl(0, "FloatBorder", { bg = "none" })
	hl(0, "Pmenu", { bg = "none" })
	hl(0, "PmenuSel", { bg = "none" })
end)

--gradle testing
vim.keymap.set("n", "<leader>gt", "<cmd>!./gradlew test > testing.txt<CR>")
vim.keymap.set("n", "<leader>gr", "<cmd>!./gradlew run > running.txt<CR>")

vim.keymap.set({ "i", "t", "n" }, "<A-e>", "<Esc>")
vim.keymap.set("i", "<A-w>", "<Esc>:w<CR>")
vim.keymap.set("n", "<A-w>", ":w<CR>")
vim.keymap.set("n", "<A-q>", ":wq<CR>")
vim.keymap.set("i", "<A-q>", "<Esc>:wq<CR>")
vim.keymap.set({ "n", "v" }, ";", ":")
vim.keymap.set({ "n", "v" }, ":", ";")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<A-j>", "<C-d>zz")
vim.keymap.set("n", "<A-k>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "=ap", "ma=ap'a")
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

vim.keymap.set("n", "x", '"_x')

--jump remaps
vim.keymap.set("n", "<A-o>", "<C-o>", { desc = "Jump back in jump list" })
vim.keymap.set("n", "<A-i>", "<C-i>", { desc = "Jump forward in jump list" })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set("v", "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set({ "n", "v" }, "<A-h>", "_")
vim.keymap.set({ "n", "v" }, "<A-l>", "$")
vim.keymap.set("n", "<leader>ch", "c0")
vim.keymap.set("n", "<leader>cl", "c$")
vim.keymap.set("n", "<leader>dh", "d0")
vim.keymap.set("n", "<leader>dl", "d$")
vim.keymap.set("n", "<leader>yh", "y0")
vim.keymap.set("n", "<leader>yl", "y$")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>")
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>")
vim.keymap.set("n", "<leader>tn", ":tabn<CR>")
vim.keymap.set("n", "<leader>tp", ":tabp<CR>")
