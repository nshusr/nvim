-- https://github.com/lukas-reineke/indent-blankline.nvim

local options = {
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = true
}

require("indent_blankline").setup(options)
