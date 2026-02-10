vim.opt.relativenumber = true

vim.opt.cursorline = false
vim.opt.number = true

vim.g.have_nerd_font = true
vim.opt.background = "dark"

vim.g.ai_cmp = true

vim.opt.clipboard = ""

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.showtabline = 0
vim.opt.list = false

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.fillchars = { eob = " " } -- Change ~ to >

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300
