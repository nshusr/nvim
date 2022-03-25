-- https://github.com/hrsh7th/nvim-cmp
-- https://github.com/hrsh7th/vim-vsnip
-- https://github.com/hrsh7th/cmp-vsnip
-- https://github.com/hrsh7th/cmp-nvim-lsp
-- https://github.com/hrsh7th/cmp-path
-- https://github.com/hrsh7th/cmp-buffer
-- https://github.com/hrsh7th/cmp-cmdline
-- https://github.com/rafamadriz/friendly-snippets
-- https://github.com/tzachar/cmp-tabnine
-- https://github.com/kristijanhusak/vim-dadbod-completion

-- FIX: Manually install Tabnine when there is an error in Tabnine
--    TabNine is not executable
-- Requires curl
--    ~/.local/share/nvim/site/pack/packer/opt/cmp-tabnine/install.sh
local keybinds = require("core.keybinds")

local lspkind = require("lspkind")
local cmp = require("cmp")

cmp.setup(
    ---@diagnostic disable-next-line: redundant-parameter
    {
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end
        },
        sources = cmp.config.sources(
            {
                {name = "vsnip"},
                {name = "nvim_lsp"},
                {name = "path"},
                {name = "buffer"},
                {name = "cmdline"},
                {name = "cmp_tabnine"},
                {name = "vim-dadbod-completion"}
            }
        ),
        formatting = {
            format = lspkind.cmp_format(
                {
                    with_text = true,
                    maxwidth = 50,
                    before = function(entry, vim_item)
                        vim_item.menu = "<" .. string.upper(entry.source.name) .. ">"
                        return vim_item
                    end
                }
            )
        },
        mapping = {
            -- You can add {behavior u003d cmp.SelectBehavior.Select} to mimic vscode's behavior
            -- When checked, content will not be automatically inserted
            -- select_prev_item({behavior = cmp.SelectBehavior.Select})
            [keybinds.mapping.plugin.nvim_cmp.select_prev_item] = cmp.mapping.select_prev_item(),
            [keybinds.mapping.plugin.nvim_cmp.select_next_item] = cmp.mapping.select_next_item(),
            [keybinds.mapping.plugin.nvim_cmp.confirm_current] = cmp.mapping.confirm(),
            [keybinds.mapping.plugin.nvim_cmp.toggle_complete] = cmp.mapping(
                {
                    i = function()
                        if cmp.visible() then
                            cmp.abort()
                        else
                            cmp.complete()
                        end
                    end,
                    c = function()
                        if cmp.visible() then
                            cmp.abort()
                        else
                            cmp.complete()
                        end
                    end
                }
            ),
            [keybinds.mapping.plugin.nvim_cmp.confirm_or_next_item_and_next_snippet_placeholder] = cmp.mapping(
                cmp.mapping.confirm({select = true}),
                {"i", "s", "c"}
            )
        },
        sorting = {
            priority_weight = 2,
            comparators = {
                cmp.config.compare.offset,
                cmp.config.compare.sort_text,
                cmp.config.compare.exact,
                cmp.config.compare.score,
                cmp.config.compare.recently_used,
                cmp.config.compare.kind,
                cmp.config.compare.length,
                cmp.config.compare.order
            }
        }
    }
)

cmp.setup.cmdline(
    "/",
    {
        sources = {
            {name = "buffer"}
        }
    }
)

cmp.setup.cmdline(
    "?",
    {
        sources = {
            {name = "buffer"}
        }
    }
)

cmp.setup.cmdline(
    ":",
    {
        sources = cmp.config.sources(
            {
                {name = "path"}
            },
            {
                {name = "cmdline"}
            }
        )
    }
)
