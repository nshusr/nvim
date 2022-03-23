-- https://github.com/nvim-treesitter/nvim-treesitter
-- https://github.com/p00f/nvim-ts-rainbow
-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring

local keybinds = require("core.keybinds")

require("nvim-treesitter.configs").setup(
    {
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
            enable = false,
            keymaps = keybinds.mapping.plugin.nvim_treesitter.incremental_selection_keymaps
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
)

vim.o.foldexpr = "nvim_treesitter#foldexpr()"
