-- https://github.com/AndrewRadev/switch.vim

local str = require("tools.str")

local switch_words = {
    -- status
    {"true", "false"},
    {"on", "off"},
    {"yes", "no"},
    {"disable", "enable"},
    {"open", "close"},
    {"in", "out"},
    {"resolve", "reject"},
    -- event
    {"start", "end"},
    {"before", "after"},
    {"from", "to"},
    {"relative", "absolute"},
    -- direction
    {"up", "down"},
    {"left", "right"},
    {"row", "column"},
    -- color
    {"drak", "light"},
    {"white", "black"},
    -- network
    {"get", "post"},
    -- symbol
    {"+", "-"},
    {">", "<"},
    {"=", "!="}
}

local save_words = {}

for _, value in ipairs(switch_words) do
    local x, y = value[1], value[2]
    table.insert(save_words, value)
    table.insert(save_words, {string.upper(x), string.upper(y)})
    table.insert(save_words, {str.title(x), str.title(y)})
end

vim.g.switch_custom_definitions = save_words
