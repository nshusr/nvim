-- https://github.com/tami5/lspsaga.nvim

local lspsaga_key = vim.u.keymap.plugin_set_key.lspsaga

local options = {
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
    code_action_keys = lspsaga_key.code_action_keys,
    rename_action_keys = lspsaga_key.rename_action_keys
}

require("lspsaga").setup(options)
