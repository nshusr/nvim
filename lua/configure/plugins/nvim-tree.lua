-- https://github.com/kyazdani42/nvim-tree.lua

local options = {
    auto_close = true,
    view = {
        width = 30,
        height = 30,
        hide_root_folder = false,
        auto_resize = true
    },
    diagnostics = {
        enable = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = ""
        }
    },
    git = {
        enable = false,
        ignore = true,
        timeout = 500
    }
}

vim.g.nvim_tree_icons = {
    default = " ",
    symlink = " ",
    git = {
        unstaged = "",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "",
        deleted = "",
        ignored = ""
    },
    folder = {
        -- arrow_open = "╰─▸",
        -- arrow_closed = "├─▸",
        arrow_open = "",
        arrow_closed = "",
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        symlink_open = ""
    }
}

-- add a backslash / after the directory
vim.g.nvim_tree_add_trailing = 1

require("nvim-tree").setup(options)

