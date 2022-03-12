-- https://github.com/folke/which-key.nvim

local options = {
    plugins = {
        spelling = {
            -- Whether to take over the default zu003d behavior
            enabled = true,
            suggestions = 20
        }
    }
}

require("which-key").setup(options)
