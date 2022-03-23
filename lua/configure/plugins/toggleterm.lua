-- https://github.com/akinsho/toggleterm.nvim

local toggleterm = require("toggleterm")
local keybinds = require("core.keybinds")

toggleterm.setup(
    {
        start_in_insert = false,
        size = 6,
        on_open = function()
            vim.cmd("setlocal nospell")
        end
    }
)

-- new term
local terminal = require("toggleterm.terminal").Terminal

local function inInsert()
    -- enter insert mode
    vim.cmd("startinsert")
    -- unmap esc
    keybinds.fn.del_global_keymap("t", keybinds.mapping.plugin.toggleterm.delete_all_exit)
end

-- create float term
local float_term =
    terminal:new(
    {
        hidden = true,
        direction = "float",
        float_opts = {
            border = "double"
        },
        on_open = function(term)
            inInsert()
            keybinds.fn.set_buffer_keymap(
                term.bufnr,
                "t",
                keybinds.mapping.plugin.toggleterm.float.float_exit,
                "<c-\\><c-n>:close<cr>",
                keybinds.opts.ntst
            )
        end,
        on_close = function()
            -- remap esc
            keybinds.fn.set_global_keymap(
                "t",
                keybinds.mapping.plugin.toggleterm.float.again_exit,
                "<c-\\><c-n>",
                keybinds.opts.ntst
            )
        end
    }
)

-- create lazy git term
local lazy_git =
    terminal:new(
    {
        cmd = "lazygit",
        hidden = true,
        direction = "float",
        float_opts = {
            border = "double"
        },
        on_open = function(term)
            inInsert()
            -- q in lazygit is quit
            keybinds.fn.set_buffer_keymap(
                term.bufnr,
                "i",
                keybinds.mapping.plugin.toggleterm.lazygit.lazygit_exit,
                "<cmd>close<cr>",
                keybinds.opts.ntst
            )
        end,
        on_close = function()
            -- remap esc
            keybinds.fn.set_global_keymap(
                "t",
                keybinds.mapping.plugin.toggleterm.lazygit.again_exit,
                "<c-\\><c-n>",
                keybinds.opts.ntst
            )
        end
    }
)

-- define new method
toggleterm.float_toggle = function()
    float_term:toggle()
end

toggleterm.lazygit_toggle = function()
    lazy_git:toggle()
end
