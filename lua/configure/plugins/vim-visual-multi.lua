-- https://github.com/mg979/vim-visual-multi

local keybinds = require("core.keybinds")

vim.g.VM_default_mappings = 0
vim.g.VM_maps = {
    ["Switch Mode"] = keybinds.mapping.plugin.vim_visual_multi.switch_mode,
    ["Find Under"] = keybinds.mapping.plugin.vim_visual_multi.find_under,
    ["Skip Region"] = keybinds.mapping.plugin.vim_visual_multi.skip_region,
    ["Remove Region"] = keybinds.mapping.plugin.vim_visual_multi.remove_region
}
