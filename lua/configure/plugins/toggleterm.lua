-- https://github.com/akinsho/toggleterm.nvim

local toggleterm = require("toggleterm")
local keymap_func = vim.u.keymap.func
local keymap_opts = vim.u.keymap.opts
local toggleterm_key = vim.u.keymap.plugin_set_key.toggleterm

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
    keymap_func.delete_keymap("t", toggleterm_key.delete_all_exit)
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
            keymap_func.buffer_set_keymap(
                term.bufnr,
                "t",
                toggleterm_key.float.float_exit,
                "<c-\\><c-n>:close<cr>",
                keymap_opts.ntst
            )
        end,
        on_close = function()
            -- remap esc
            keymap_func.global_set_keymap("t", toggleterm_key.float.again_exit, "<c-\\><c-n>", keymap_opts.ntst)
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
            keymap_func.buffer_set_keymap(
                term.bufnr,
                "i",
                toggleterm_key.lazygit.lazygit_exit,
                "<cmd>close<cr>",
                keymap_opts.ntst
            )
        end,
        on_close = function()
            -- remap esc
            keymap_func.global_set_keymap("t", toggleterm_key.lazygit.again_exit, "<c-\\><c-n>", keymap_opts.ntst)
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
