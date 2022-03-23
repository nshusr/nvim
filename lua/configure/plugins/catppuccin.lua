-- https://github.com/catppuccin/nvim

local options = require("core.options")

local catppuccin = require("catppuccin")

catppuccin.setup(
    {
        -- transparent workspace background
        transparent_background = options.TRANSPARENCY_BACKGROUND,
        -- use terminal color
        term_color = false,
        -- code style
        styles = {
            comments = "italic",
            functions = "NONE",
            keywords = "NONE",
            strings = "NONE",
            variables = "NONE"
        },
        -- unified plugins style
        integrations = {
            cmp = true,
            gitsigns = true,
            telescope = true,
            which_key = true,
            bufferline = true,
            markdown = true,
            ts_rainbow = true,
            hop = true,
            notify = true,
            indent_blankline = {
                enabled = true,
                colored_indent_levels = false
            },
            nvimtree = {
                enabled = true,
                show_root = false,
                -- transparent NvimTree background
                transparent_panel = options.TRANSPARENCY_BACKGROUND
            },
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = "italic",
                    hints = "italic",
                    warnings = "italic",
                    information = "italic"
                },
                underlines = {
                    errors = "underline",
                    hints = "underline",
                    warnings = "underline",
                    information = "underline"
                }
            },
            -- manual setting
            lsp_saga = true
        }
    }
)

catppuccin.after_loading = function()
    if options.TRANSPARENCY_BACKGROUND then
        -- lsp_signature
        vim.cmd([[
            highlight! NormalFloat guibg=NONE
        ]])
    else
        vim.cmd(
            [[
            highlight! NormalFloat guibg=#1E1E2E
            highlight! FloatBorder guibg=#1E1E2E
        ]]
        )
    end

    vim.cmd(
        [[
            " lspsaga
            highlight! LspSagaRenameBorder guifg=#96CDF8
            highlight! LspSagaHoverBorder guifg=#96CDF8
            highlight! LspSagaDocTruncateLine guifg=#96CDF8
            highlight! LspSagaDiagnosticBorder guifg=#96CDF8
            highlight! LspSagaDiagnosticTruncateLine guifg=#96CDF8
            " telescope
            highlight! TelescopeBorder guifg=#96CDF8
            " highlight! TelescopeSelection guibg=#ABE9B3 guifg=#000000 gui=NONE
            highlight! TelescopeMatching guifg=#96CDF8 gui=bold
            " cmp match
            highlight! CmpItemAbbrMatch guibg=NONE guifg=#96CDF8
            highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#96CDF8
            " cmp selection
            highlight! PmenuSel guibg=#ABE9B3 guifg=#000000 gui=NONE
            " indent_blankline
            highlight! IndentBlanklineContextChar guifg=#96CDF8
            highlight! IndentBlanklineChar guifg=#575268
]]
    )
end

vim.cmd([[colorscheme catppuccin]])
