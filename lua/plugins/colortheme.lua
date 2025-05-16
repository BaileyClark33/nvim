return {
    {
        "zaldih/themery.nvim",
        lazy = false,
        config = function()
            require("themery").setup({
                -- Your list of installed colorschemes.
                themes = {
                    "gruvbox",
                    "NeoSolarized",
                    "aurora",
                    "onedark",
                    "citruszest",
                    "cyberdream",
                    "vividchalk",
                    "bluloco",
                    "tokyonight",
                    "industry",
                    "rose-pine",
                    "one_monokai",
                    "miasma",
                },
                globalAfter = [[
                                  local hl = vim.api.nvim_set_hl
                                  hl(0, "Normal", { bg = "none" })
                                  hl(0, "NormalNC", { bg = "none" })
                                  hl(0, "EndOfBuffer", { bg = "none", fg = "none" })
                                  hl(0, "SignColumn", { bg = "none" })
                                  hl(0, "LineNr", { fg = "#888888", bg = "none" })
                                  hl(0, "NormalFloat", { bg = "none" })
                                  hl(0, "FloatBorder", { bg = "none" })
                                  hl(0, "Pmenu", { bg = "none" })
                              ]],
                livePreview = true, -- Apply theme while picking. Default to true.
            })
            vim.keymap.set("n", "<leader>cs", ":Themery<CR>")
        end,
    },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                transparent_mode = true,
                italic = {
                    strings = false,
                    emphasis = true,
                    comments = true,
                    operators = false,
                    folds = true,
                },
            })
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = { transparent = true },
    },
    -- lua/plugins/rose-pine.lua
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                styles = { italic = true, transparency = true },
            })
        end,
    },
    {
        "navarasu/onedark.nvim",
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require("onedark").setup({
                style = "darker",
                transparent = true,
            })
        end,
    },
    {
        "scottmckendry/cyberdream.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("cyberdream").setup({
                transparent = true,
            })
        end,
    },
    {
        "uloco/bluloco.nvim",
        lazy = false,
        priority = 1000,
        dependencies = { "rktjmp/lush.nvim" },
        config = function()
            require("bluloco").setup({
                transparent = true,
                guicursor = false,
            })
        end,
    },
    {
        "zootedb0t/citruszest.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("citruszest").setup({
                option = {
                    transparent = true, -- Enable/Disable transparency
                },
            })
        end,
    },
    {
        "Tsuzat/NeoSolarized.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
    },
    {
        "ray-x/aurora",
        init = function()
            vim.g.aurora_italic = 1
            vim.g.aurora_transparent = 1
            vim.g.aurora_bold = 1
        end,
        config = function()
            vim.api.nvim_set_hl(0, "@number", { fg = "#e933e3" })
        end,
    },
    {
        "cpea2506/one_monokai.nvim",
        config = function()
            require("one_monokai").setup({
                transparent = true,
            })
        end,
    },
    {
        "xero/miasma.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "tpope/vim-vividchalk",
    },
}
