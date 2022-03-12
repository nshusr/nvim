-- https://github.com/terryma/vim-multiple-cursors

local vim_multiple_cursors_key = vim.u.keymap.plugin_set_key.vim_multiple_cursors

-- disable default key mapping
vim.g.multi_cursor_use_default_mapping = 0

vim.g.multi_cursor_start_word_key = vim_multiple_cursors_key.start_word_key
vim.g.multi_cursor_next_key = vim_multiple_cursors_key.next_key
vim.g.multi_cursor_prev_key = vim_multiple_cursors_key.prev_key
vim.g.multi_cursor_skip_key = vim_multiple_cursors_key.skip_key
vim.g.multi_cursor_quit_key = vim_multiple_cursors_key.quit_key
