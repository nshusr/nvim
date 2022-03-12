-- https://github.com/AndrewRadev/switch.vim

local utils = require("tools.utils")

local switch_words = {
    {"true", "false"},
    {"on", "off"},
    {"yes", "no"},
    {"disable", "enable"},
    {"+", "-"},
    {">", "<"},
    {"=", "!="}
}

local save_words = {}

for _, value in ipairs(switch_words) do
    local x, y = value[1], value[2]
    table.insert(save_words, value)
    table.insert(save_words, {string.upper(x), string.upper(y)})
    table.insert(save_words, {utils.str.title(x), utils.str.title(y)})
end

vim.g.switch_custom_definitions = save_words
