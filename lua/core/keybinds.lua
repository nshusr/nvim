vim.g.mapleader = " "

local function register_global_key(area_name)
    local global_area = vim.u.keymap.global_mapping[area_name]
    for _, value in ipairs(global_area) do
        local opt = vim.u.keymap.opts[value[4]]
        vim.u.keymap.func.global_set_keymap(value[1], value[2], value[3], opt)
    end
end

local function register_buffer_key(area_name, bufnr)
    local buffer_area = vim.u.keymap.buffer_mapping[area_name]
    for _, value in ipairs(buffer_area) do
        local opt = vim.u.keymap.opts[value[4]]
        vim.u.keymap.func.buffer_set_keymap(bufnr, value[1], value[2], value[3], opt)
    end
end

vim.u.keymap = {
    opts = {
        ntst = {noremap = true, silent = true},
        ntsf = {noremap = true, silent = false},
        etst = {expr = true, silent = true},
        none = {}
    },
    func = {
        register_global_key = register_global_key,
        register_buffer_key = register_buffer_key,
        global_set_keymap = vim.api.nvim_set_keymap,
        buffer_set_keymap = vim.api.nvim_buf_set_keymap,
        delete_keymap = vim.api.nvim_del_keymap
    },
    global_mapping = {
        baisc = {
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
            {"n", "<leader>ch", ":CarbonNowSh<cr>", "ntst"}
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
            {"n", "<leader>fn", "<cmd>lua require('telescope').extensions.notify.notify() theme=dropdown<cr>", "ntst"}
        },
        telescope = {
            {"n", "<leader>ff", "<cmd>Telescope find_files theme=dropdown<cr>", "ntst"},
            {"n", "<leader>fg", "<cmd>Telescope live_grep theme=dropdown<cr>", "ntst"},
            {"n", "<leader>fo", "<cmd>Telescope oldfiles theme=dropdown<cr>", "ntst"},
            {"n", "<leader>fm", "<cmd>Telescope marks theme=dropdown<cr>", "ntst"},
            {"n", "<leader>fh", "<cmd>Telescope resume theme=dropdown<cr>", "ntst"}
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
    buffer_mapping = {
        nvim_lsp_installer = {
            {"n", "gd", "<cmd>Telescope lsp_definitions theme=dropdown<CR>", "ntst"},
            {"n", "gr", "<cmd>Telescope lsp_references theme=dropdown<CR>", "ntst"},
            {"n", "go", "<cmd>Telescope diagnostics theme=dropdown<CR>", "ntst"},
            {"n", "gh", "<cmd>Lspsaga hover_doc<CR>", "ntst"},
            {"n", "g[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", "ntst"},
            {"n", "g]", "<cmd>Lspsaga diagnostic_jump_next<CR>", "ntst"},
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
        }
    },
    plugin_set_key = {
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
            current_or_next = "<tab>"
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

-- start mapping global key
for area_name, _ in pairs(vim.u.keymap.global_mapping) do
    vim.u.keymap.func.register_global_key(area_name)
end
