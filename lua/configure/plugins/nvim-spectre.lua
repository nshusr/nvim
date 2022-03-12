-- https://github.com/nvim-pack/nvim-spectre

-- WARN: spectre manually install dependencies sed and ripgrep

-- • yay -S sed
-- • https://github.com/BurntSushi/ripgrep

local nvim_spectre_key = vim.u.keymap.plugin_set_key.nvim_spectre

local options = {
    mapping = {
        [nvim_spectre_key.toggle_line] = {
            map = "dd",
            cmd = "<cmd>lua require('spectre').toggle_line()<cr>",
            desc = "toggle current item"
        },
        [nvim_spectre_key.select_entry] = {
            map = "<cr>",
            cmd = "<cmd>lua require('spectre.actions').select_entry()<cr>",
            desc = "goto current file"
        },
        [nvim_spectre_key.show_option_menu] = {
            map = "<leader>o",
            cmd = "<cmd>lua require('spectre').show_options()<cr>",
            desc = "show option"
        },
        [nvim_spectre_key.run_replace] = {
            map = "<leader>r",
            cmd = "<cmd>lua require('spectre.actions').run_replace()<cr>",
            desc = "replace all"
        },
        [nvim_spectre_key.change_view_mode] = {
            map = "<leader>v",
            cmd = "<cmd>lua require('spectre').change_view()<cr>",
            desc = "change result view mode"
        }
    }
}

require("spectre").setup(options)
