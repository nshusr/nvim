-- https://github.com/github/copilot.vim

vim.g.copilot_no_tab_map = true
-- because of lazy loading, you need to remove the tab binding here
vim.u.keymap.func.delete_keymap("i", "<tab>")
