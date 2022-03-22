-- https://github.com/hrsh7th/nvim-cmp
-- https://github.com/hrsh7th/vim-vsnip
-- https://github.com/hrsh7th/cmp-vsnip
-- https://github.com/hrsh7th/cmp-nvim-lsp
-- https://github.com/hrsh7th/cmp-path
-- https://github.com/hrsh7th/cmp-buffer
-- https://github.com/hrsh7th/cmp-cmdline
-- https://github.com/f3fora/cmp-spell
-- https://github.com/rafamadriz/friendly-snippets
-- https://github.com/tzachar/cmp-tabnine
-- https://github.com/kristijanhusak/vim-dadbod-completion

-- FIX: Manually install Tabnine when there is an error in Tabnine
--    TabNine is not executable
-- Requires curl
--    ~/.local/share/nvim/site/pack/packer/opt/cmp-tabnine/install.sh

local lspkind = require("lspkind")
local cmp = require("cmp")
local nvim_cmp_key = vim.u.keymap.plugin_set_key.nvim_cmp

vim.g.vsnip_snippet_dir = vim.u.code_snippet_directory

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

---@diagnostic disable-next-line: redundant-parameter
local options = {
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
            {name = "spell"},
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
        [nvim_cmp_key.select_prev_item] = cmp.mapping.select_prev_item(),
        [nvim_cmp_key.select_next_item] = cmp.mapping.select_next_item(),
        [nvim_cmp_key.confirm_current] = cmp.mapping.confirm(),
        [nvim_cmp_key.toggle_complete] = cmp.mapping(
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
        [nvim_cmp_key.confirm_or_next_item_and_next_snippet_placeholder] = cmp.mapping(
            function(fallback)
                if cmp.visible() then
                    cmp.confirm({select = true})
                elseif vim.fn["vsnip#available"](1) == 1 then
                    feedkey("<Plug>(vsnip-expand-or-jump)", "")
                else
                    fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
                end
            end,
            {"i", "s", "c"}
        ),
        [nvim_cmp_key.prev_item_and_prev_snippet_placeholder] = cmp.mapping(
            function()
                if cmp.visible() then
                    cmp.select_prev_item({behavior = cmp.SelectBehavior.Select})
                elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                    feedkey("<Plug>(vsnip-jump-prev)", "")
                end
            end,
            {"i", "s", "c"}
        )
    }
}

---@diagnostic disable-next-line: redundant-parameter
cmp.setup(options)

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
