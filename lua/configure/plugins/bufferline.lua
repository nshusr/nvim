-- https://github.com/akinsho/bufferline.nvim

local options = {
    options = {
        -- The number of lines to show in the buffer.
        numbers = "ordinal",
        -- diagnostics source
        diagnostics = "nvim_lsp",
        -- built-in icons
        indicator_icon = "▎",
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        -- split style："slant" | "thick" | "thin"
        separator_style = "thin",
        -- The left side yields the position of the NvimTree
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left"
            }
        },
        -- show diagnostics icons
        ---@diagnostic disable-next-line: unused-local
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and " " or (e == "warning" and " " or "")
                s = s .. n .. sym
            end
            return s
        end
    }
}

require("bufferline").setup(options)
