-- https://github.com/mg979/vim-visual-multi

local vim_visual_multi_key = vim.u.keymap.plugin_set_key.vim_visual_multi

vim.g.VM_default_mappings = 0
vim.g.VM_maps = {
    ["Switch Mode"] = vim_visual_multi_key.switch_mode,
    ["Find Under"] = vim_visual_multi_key.find_under,
    ["Skip Region"] = vim_visual_multi_key.skip_region,
    ["Remove Region"] = vim_visual_multi_key.remove_region
}
