vim.g.mapleader = " "

local function set_global_keymap(mode, lhs, rhs, opts)
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

local function del_global_keymap(mode, lhs)
    vim.api.nvim_del_keymap(mode, lhs)
end

local function set_buffer_keymap(buffer, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(buffer, mode, lhs, rhs, opts)
end

local function del_buffer_keymap(buffer, mode, lhs)
    vim.api.nvim_buf_del_keymap(buffer, mode, lhs)
end

local function register_global_key(mapping_name)
    local global_mapping = M.mapping.global[mapping_name]
    for _, keymap in ipairs(global_mapping) do
        local opts = M.opts[keymap[4]]
        set_global_keymap(keymap[1], keymap[2], keymap[3], opts)
    end
end

local function register_buffer_key(mapping_name, bufnr)
    local buffer_mapping = M.mapping.buffer[mapping_name]
    for _, keymap in ipairs(buffer_mapping) do
        local opts = M.opts[keymap[4]]
        set_buffer_keymap(bufnr, keymap[1], keymap[2], keymap[3], opts)
    end
end

M = {
    fn = {
        set_global_keymap = set_global_keymap,
        del_global_keymap = del_global_keymap,
        set_buffer_keymap = set_buffer_keymap,
        del_buffer_keymap = del_buffer_keymap,
        register_global_key = register_global_key,
        register_buffer_key = register_buffer_key
    },
    opts = {
        ntst = {noremap = true, silent = true},
        ntsf = {noremap = true, silent = false},
        etst = {expr = true, silent = true},
        none = {}
    },
    mapping = {
        global = {
            basic = {
                {"n", "\\\\", "<cmd>qa!<cr>", "ntst"},
                {"n", "<esc>", ":nohlsearch<cr>", "ntst"},
                {"t", "<esc>", "<c-\\><c-n>", "ntst"},
                {"i", "jj", "<esc>", "ntst"},
                {"n", "H", "^", "ntst"},
                {"v", "H", "^", "ntst"},
                {"n", "L", "$", "ntst"},
                {"v", "L", "$", "ntst"},
                {"n", "<c-u>", "10k", "ntst"},
                {"n", "<c-d>", "10j", "ntst"},
                {"i", "<a-k>", "<up>", "ntst"},
                {"i", "<a-j>", "<down>", "ntst"},
                {"i", "<a-h>", "<left>", "ntst"},
                {"i", "<a-l>", "<right>", "ntst"},
                {"n", "<a-k>", "<cmd>res +1<cr>", "ntst"},
                {"n", "<a-j>", "<cmd>res -1<cr>", "ntst"},
                {"n", "<a-h>", "<cmd>vertical resize-1<cr>", "ntst"},
                {"n", "<a-l>", "<cmd>vertical resize+1<cr>", "ntst"},
                {"n", "<leader>cs", "<cmd>set spell!<cr>", "ntst"}
            },
            neoformat = {
                {"n", "<leader>cf", "<cmd>Neoformat<cr>", "ntst"}
            },
            vim_carbon_now_sh = {
                {"v", "<leader>ch", ":CarbonNowSh<cr>", "ntst"},
                {"n", "<leader>ch", "ggVG:CarbonNowSh<cr><c-o>", "ntst"}
            },
            vim_vsnip = {
                {"i", "<tab>", "vsnip#jumpable(1)?'<Plug>(vsnip-jump-next)':'<tab>'", "etst"},
                {"i", "<s-tab>", "vsnip#jumpable(-1)?'<Plug>(vsnip-jump-prev)':'<s-tab>'", "etst"},
                {"s", "<tab>", "vsnip#jumpable(1)? '<Plug>(vsnip-jump-next)':'<tab>'", "etst"},
                {"s", "<s-tab>", "vsnip#jumpable(-1)?'<Plug>(vsnip-jump-prev)':'<s-tab>'", "etst"}
            },
            switch = {
                {"n", "gs", ":Switch<cr>", "ntst"}
            },
            copilot = {
                {"i", "<c-l>", "copilot#Accept('')", "etst"}
            },
            nvim_tree = {
                {"n", "<leader>1", "<cmd>NvimTreeToggle<cr>", "ntst"},
                {"n", "<leader>fc", "<cmd>NvimTreeFindFile<cr>", "ntst"}
            },
            undotree = {
                {"n", "<leader>3", ":UndotreeToggle<cr>", "ntst"}
            },
            vim_dadbod_ui = {
                {"n", "<leader>4", ":DBUIToggle<cr>", "ntst"}
            },
            venn = {
                {"n", "<leader>5", ":lua Toggle_venn()<cr>", "ntsf"}
            },
            todo_comments = {
                {"n", "<leader>ft", "<cmd>TodoTelescope theme=dropdown<cr>", "ntst"}
            },
            nvim_notify = {
                {
                    "n",
                    "<leader>fn",
                    "<cmd>lua require('telescope').extensions.notify.notify() theme=dropdown<cr>",
                    "ntst"
                }
            },
            telescope = {
                {"n", "<leader>ff", "<cmd>Telescope find_files theme=dropdown<cr>", "ntst"},
                {"n", "<leader>fg", "<cmd>Telescope live_grep theme=dropdown<cr>", "ntst"},
                {"n", "<leader>fo", "<cmd>Telescope oldfiles theme=dropdown<cr>", "ntst"},
                {"n", "<leader>fm", "<cmd>Telescope marks theme=dropdown<cr>", "ntst"},
                {"n", "<leader>fh", "<cmd>Telescope resume theme=dropdown<cr>", "ntst"}
            },
            persisted = {
                {"n", "<leader>sl", ":SessionLoad<cr><cr>", "ntsf"},
                {"n", "<leader>ss", ":SessionSave<cr>", "ntsf"},
                {"n", "<leader>sd", ":SessionDelete<cr>", "ntsf"}
            },
            bufferline = {
                {"n", "<c-q>", "<cmd>Bdelete!<cr>", "ntst"},
                {"n", "<c-h>", "<cmd>BufferLineCyclePrev<cr>", "ntst"},
                {"n", "<c-l>", "<cmd>BufferLineCycleNext<cr>", "ntst"},
                {"n", "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", "ntst"},
                {"n", "<leader>bl", "<cmd>BufferLineCloseRight<cr>", "ntst"},
                {"n", "<leader>bo", "<cmd>BufferLineCloseLeft<cr><cmd>BufferLineCloseRight<cr>", "ntst"},
                {"n", "<leader>b1", "<cmd>BufferLineGoToBuffer 1<cr>", "ntst"},
                {"n", "<leader>b2", "<cmd>BufferLineGoToBuffer 2<cr>", "ntst"},
                {"n", "<leader>b3", "<cmd>BufferLineGoToBuffer 3<cr>", "ntst"},
                {"n", "<leader>b4", "<cmd>BufferLineGoToBuffer 4<cr>", "ntst"},
                {"n", "<leader>b5", "<cmd>BufferLineGoToBuffer 5<cr>", "ntst"},
                {"n", "<leader>b6", "<cmd>BufferLineGoToBuffer 6<cr>", "ntst"},
                {"n", "<leader>b7", "<cmd>BufferLineGoToBuffer 7<cr>", "ntst"},
                {"n", "<leader>b8", "<cmd>BufferLineGoToBuffer 8<cr>", "ntst"},
                {"n", "<leader>b9", "<cmd>BufferLineGoToBuffer 9<cr>", "ntst"},
                {"n", "<leader>bt", "<cmd>BufferLinePick<cr>", "ntst"}
            },
            hop = {
                {"n", "<leader>hw", "<cmd>HopWord<cr>", "ntst"},
                {"n", "<leader>hl", "<cmd>HopLine<cr>", "ntst"},
                {"n", "<leader>hc", "<cmd>HopChar1<cr>", "ntst"}
            },
            nvim_dap = {
                {"n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "ntst"},
                {"n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", "ntst"},
                {"n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", "ntst"},
                {"n", "<F6>", "<cmd>lua require'dap'.step_into()<cr>", "ntst"},
                {"n", "<F7>", "<cmd>lua require'dap'.step_over()<cr>", "ntst"},
                {"n", "<F8>", "<cmd>lua require'dap'.step_out()<cr>", "ntst"},
                {"n", "<F9>", "<cmd>lua require'dap'.run_last()<cr>", "ntst"},
                {
                    "n",
                    "<F10>",
                    "<cmd>lua require'dap'.close()<cr><cmd>lua require'dap.repl'.close()<cr><cmd>lua require'dapui'.close()<CR><cmd>DapVirtualTextForceRefresh<CR>",
                    "ntst"
                }
            },
            nvim_hlslens = {
                {
                    "n",
                    "n",
                    "<cmd>execute('normal!'.v:count1.'n')<cr><cmd>lua require('hlslens').start()<cr>",
                    "ntst"
                },
                {
                    "n",
                    "N",
                    "<cmd>execute('normal!'.v:count1.'N')<cr><cmd>lua require('hlslens').start()<cr>",
                    "ntst"
                },
                {"n", "*", "*<cmd>lua require('hlslens').start()<cr>", "ntst"},
                {"n", "#", "#<cmd>lua require('hlslens').start()<cr>", "ntst"},
                {"n", "g*", "g*<cmd>lua require('hlslens').start()<cr>", "ntst"},
                {"n", "g#", "g#<cmd>lua require('hlslens').start()<cr>", "ntst"}
            },
            nvim_spectre = {
                {"n", "<leader>rp", "<cmd>lua require('spectre').open()<cr>", "ntst"},
                {"n", "<leader>rf", "viw:lua require('spectre').open_file_search()<cr>", "ntst"},
                {"n", "<leader>rw", "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "ntst"}
            },
            toggleterm = {
                {"n", "<leader>tt", "<cmd>exe v:count.'ToggleTerm'<cr>", "ntst"},
                {"n", "<leader>tf", "<cmd>lua require('toggleterm').float_toggle()<cr>", "ntst"},
                {"n", "<leader>tg", "<cmd>lua require('toggleterm').lazygit_toggle()<cr>", "ntst"},
                {"n", "<leader>ta", "<cmd>ToggleTermToggleAll<cr>", "ntst"}
            },
            translator = {
                {"n", "<leader>tcs", ":<c-u>Translate ZH -source=EN -output=split<cr>", "ntst"},
                {"x", "<leader>tcs", ":Translate ZH -source=EN -output=split<cr>", "ntst"},
                {"n", "<leader>tcr", ":<c-u>Translate ZH -source=EN -output=replace<cr>", "ntst"},
                {"x", "<leader>tcr", ":Translate ZH -source=EN -output=replace<cr>", "ntst"},
                {"n", "<leader>tcf", ":<c-u>Translate ZH -source=EN -output=floating<cr>", "ntst"},
                {"x", "<leader>tcf", ":Translate ZH -source=EN -output=floating<cr>", "ntst"},
                {"n", "<leader>tci", ":<c-u>Translate ZH -source=EN -output=insert<cr>", "ntst"},
                {"x", "<leader>tci", ":Translate ZH -source=EN -output=insert<cr>", "ntst"},
                {"n", "<leader>tes", ":<c-u>Translate EN -source=ZH -output=split<cr>", "ntst"},
                {"x", "<leader>tes", ":Translate EN -source=ZH -output=split<cr>", "ntst"},
                {"n", "<leader>ter", ":<c-u>Translate EN -source=ZH -output=replace<cr>", "ntst"},
                {"x", "<leader>ter", ":Translate EN -source=ZH -output=replace<cr>", "ntst"},
                {"n", "<leader>tef", ":<c-u>Translate EN -source=ZH -output=floating<cr>", "ntst"},
                {"x", "<leader>tef", ":Translate EN -source=ZH -output=floating<cr>", "ntst"},
                {"n", "<leader>tei", ":<c-u>Translate EN -source=ZH -output=insert<cr>", "ntst"},
                {"x", "<leader>tei", ":Translate EN -source=ZH -output=insert<cr>", "ntst"}
            }
        },
        buffer = {
            nvim_lsp_installer = {
                {"n", "gd", "<cmd>Telescope lsp_definitions theme=dropdown<CR>", "ntst"},
                {"n", "gr", "<cmd>Telescope lsp_references theme=dropdown<CR>", "ntst"},
                {"n", "go", "<cmd>Telescope diagnostics theme=dropdown<CR>", "ntst"},
                {"n", "gh", "<cmd>Lspsaga hover_doc<CR>", "ntst"},
                {"n", "[g", "<cmd>Lspsaga diagnostic_jump_prev<CR>", "ntst"},
                {"n", "]g", "<cmd>Lspsaga diagnostic_jump_next<CR>", "ntst"},
                {"n", "<c-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", "ntst"},
                {"n", "<c-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", "ntst"},
                {"n", "<leader>ca", "<cmd>Telescope lsp_code_actions theme=dropdown<CR>", "ntst"},
                {"n", "<leader>cn", "<cmd>Lspsaga rename<CR>", "ntst"}
            },
            aerial = {
                {"n", "<leader>2", "<cmd>AerialToggle! right<CR>", "none"},
                {"n", "{", "<cmd>AerialPrev<CR>", "none"},
                {"n", "}", "<cmd>AerialNext<CR>", "none"},
                {"n", "[[", "<cmd>AerialPrevUp<CR>", "none"},
                {"n", "]]", "<cmd>AerialNextUp<CR>", "none"}
            },
            venn = {
                {"n", "<c-j>", "<C-v>j:VBox<CR>", "ntsf"},
                {"n", "<c-k>", "<C-v>k:VBox<CR>", "ntsf"},
                {"n", "<c-l>", "<C-v>l:VBox<CR>", "ntsf"},
                {"n", "<c-h>", "<C-v>h:VBox<CR>", "ntsf"},
                {"v", "b", ":VBox<CR>", "ntsf"},
                {"v", "f", ":VFill<CR>", "ntsf"}
            },
            gitsigns = {
                {"n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", "etst"},
                {"n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", "etst"},
                {"n", "<leader>gr", ":Gitsigns reset_hunk<CR>", "ntst"},
                {"v", "<leader>gr", ":Gitsigns reset_hunk<CR>", "ntst"},
                {"n", "<leader>gR", "<cmd>Gitsigns reset_buffer<CR>", "ntst"},
                {"n", "<leader>gh", "<cmd>lua require'gitsigns'.blame_line{full=true}<CR>", "ntst"},
                {"n", "<leader>gl", "<cmd>Gitsigns toggle_current_line_blame<CR>", "ntst"},
                {"n", "<leader>gd", "<cmd>Gitsigns toggle_deleted<CR>", "ntst"},
                {"n", "<leader>gv", "<cmd>Gitsigns diffthis<CR>", "ntst"}
            }
        },
        plugin = {
            lsp_signature = {
                toggle_key = "<c-j>"
            },
            nvim_spectre = {
                toggle_line = "dd",
                select_entry = "<cr>",
                show_option_menu = "<leader>o",
                run_replace = "<leader>r",
                change_view_mode = "<leader>v"
            },
            nvim_cmp = {
                select_prev_item = "<c-p>",
                select_next_item = "<c-n>",
                confirm_current = "<cr>",
                toggle_complete = "<c-k>",
                confirm_or_next_item_and_next_snippet_placeholder = "<tab>"
            },
            vim_visual_multi = {
                switch_mode = "<tab>",
                find_under = "<c-n>",
                skip_region = "<c-s>",
                remove_region = "<c-p>"
            },
            lspsaga = {
                code_action_keys = {
                    quit = "<esc>",
                    exec = "<cr>"
                },
                rename_action_keys = {
                    quit = "<esc>",
                    exec = "<cr>"
                }
            },
            comment = {
                toggle = {
                    line = "gcc",
                    block = "gCC"
                },
                opleader = {
                    line = "gc",
                    block = "gC"
                },
                extra = {
                    above = "gcO",
                    below = "gco",
                    eol = "gcA"
                }
            },
            toggleterm = {
                delete_all_exit = "<esc>",
                lazygit = {
                    lazygit_exit = "q",
                    again_exit = "<esc>"
                },
                float = {
                    float_exit = "<esc>",
                    again_exit = "<esc>"
                }
            },
            nvim_treesitter = {
                incremental_selection_keymaps = {
                    init_selection = "<cr>",
                    node_incremental = "<cr>",
                    node_decremental = "<bs>",
                    scope_incremental = "<tab>"
                }
            }
        }
    }
}

for mapping_name, _ in pairs(M.mapping.global) do
    M.fn.register_global_key(mapping_name)
end

return M
