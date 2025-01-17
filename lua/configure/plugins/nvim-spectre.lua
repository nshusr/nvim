-- https://github.com/nvim-pack/nvim-spectre

-- WARN: spectre manually install dependencies sed and ripgrep

-- • yay -S sed
-- • https://github.com/BurntSushi/ripgrep

local keybinds = require("core.keybinds")

require("spectre").setup(
    {
        mapping = {
            [keybinds.mapping.plugin.nvim_spectre.toggle_line] = {
                map = "dd",
                cmd = "<cmd>lua require('spectre').toggle_line()<cr>",
                desc = "toggle current item"
            },
            [keybinds.mapping.plugin.nvim_spectre.select_entry] = {
                map = "<cr>",
                cmd = "<cmd>lua require('spectre.actions').select_entry()<cr>",
                desc = "goto current file"
            },
            [keybinds.mapping.plugin.nvim_spectre.show_option_menu] = {
                map = "<leader>o",
                cmd = "<cmd>lua require('spectre').show_options()<cr>",
                desc = "show option"
            },
            [keybinds.mapping.plugin.nvim_spectre.run_replace] = {
                map = "<leader>r",
                cmd = "<cmd>lua require('spectre.actions').run_replace()<cr>",
                desc = "replace all"
            },
            [keybinds.mapping.plugin.nvim_spectre.change_view_mode] = {
                map = "<leader>v",
                cmd = "<cmd>lua require('spectre').change_view()<cr>",
                desc = "change result view mode"
            }
        }
    }
)
