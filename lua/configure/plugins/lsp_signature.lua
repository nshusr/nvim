-- https://github.com/ray-x/lsp_signature.nvim

local keybinds = require("core.keybinds")

require("lsp_signature").setup(
    {
        bind = true,
        -- border style
        handler_opts = {
            -- double、rounded、single、shadow、none
            border = "rounded"
        },
        -- auto trigger
        floating_window = false,
        -- bind keys
        toggle_key = keybinds.mapping.plugin.lsp_signature.toggle_key,
        -- close hint message
        hint_enable = false,
        -- settings current parameter highlight
        hi_parameter = "LspSignatureActiveParameter"
    }
)
