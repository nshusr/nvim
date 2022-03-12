-- https://github.com/ray-x/lsp_signature.nvim

local lsp_signature_key = vim.u.keymap.plugin_set_key.lsp_signature

local options = {
    bind = true,
    -- border style
    handler_opts = {
        -- double、rounded、single、shadow、none
        border = "rounded"
    },
    -- auto trigger
    floating_window = false,
    -- bind keys
    toggle_key = lsp_signature_key.toggle_key,
    -- close hint message
    hint_enable = false,
    -- settings current parameter highlight
    hi_parameter = "LspSignatureActiveParameter"
}
require("lsp_signature").setup(options)
