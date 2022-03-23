-- https://github.com/numToStr/Comment.nvim
-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring

local keybinds = require("core.keybinds")

local comment_string = require("ts_context_commentstring")

require("Comment").setup(
    {
        toggler = keybinds.mapping.plugin.comment.toggle,
        opleader = keybinds.mapping.plugin.comment.opleader,
        extra = keybinds.mapping.plugin.comment.extra,
        --  nvim-ts-context-commentstring settings
        pre_hook = function(ctx)
            -- Only calculate commentstring for tsx filetypes
            if vim.bo.filetype == "typescriptreact" then
                local U = require("Comment.utils")
                -- Detemine whether to use linewise or blockwise commentstring
                local type = ctx.ctype == U.ctype.line and "__default" or "__multiline"
                -- Determine the location where to calculate commentstring from
                local location = nil
                if ctx.ctype == U.ctype.block then
                    location = comment_string.utils.get_cursor_location()
                elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
                    location = comment_string.utils.get_visual_start_location()
                end
                return comment_string.calculate_commentstring(
                    {
                        key = type,
                        location = location
                    }
                )
            end
        end
    }
)
