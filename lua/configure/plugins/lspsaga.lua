-- https://github.com/tami5/lspsaga.nvim

local keybinds = require("core.keybinds")

require("lspsaga").setup(
    {
        -- round、single、double
        border_style = "round",
        error_sign = " ",
        warn_sign = " ",
        hint_sign = " ",
        infor_sign = " ",
        diagnostic_header_icon = " ",
        -- show current write line icons
        code_action_icon = " ",
        code_action_prompt = {
            -- colose current write line hint
            enable = false,
            sign = true,
            sign_priority = 40,
            virtual_text = true
        },
        code_action_keys = keybinds.mapping.plugin.lspsaga.code_action_keys,
        rename_action_keys = keybinds.mapping.plugin.lspsaga.rename_action_keys
    }
)
