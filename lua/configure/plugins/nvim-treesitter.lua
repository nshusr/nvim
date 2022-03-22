-- https://github.com/nvim-treesitter/nvim-treesitter
-- https://github.com/p00f/nvim-ts-rainbow
-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring

local nvim_treesitter_key = vim.u.keymap.plugin_set_key.nvim_treesitter

local options = {
    -- installed highlight support sources
    ensure_installed = "maintained",
    -- synchronous download highlighting support
    sync_install = false,
    -- highlight related
    highlight = {
        enable = true,
        -- disable built-in regex highlighting
        additional_vim_regex_highlighting = false
    },
    -- incremental selection
    incremental_selection = {
        enable = true,
        keymaps = nvim_treesitter_key.incremental_selection_keymaps
    },
    -- indent have bug in python
    indent = {
        enable = false
    },
    -- nvim-ts-rainbow
    rainbow = {
        enable = true,
        extended_mode = true
    },
    -- nvim-ts-context-commentstring
    context_commentstring = {
        enable = true
    }
}

require("nvim-treesitter.configs").setup(options)

