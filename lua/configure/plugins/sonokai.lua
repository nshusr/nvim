-- https://github.com/sainnhe/sonokai
-- https://github.com/sainnhe/sonokai/blob/master/doc/sonokai.txt

-- 'default', 'atlantis', 'andromeda', 'shusia', 'maia', 'espresso'
vim.g.sonokai_style = "maia"
vim.g.sonokai_enable_italic = 1
vim.g.sonokai_disable_italic_comment = 1
vim.g.sonokai_transparent_background = vim.u.transparency_background
vim.g.sonokai_spell_foreground = "colored"
vim.g.sonokai_diagnostic_line_highlight = 1
vim.g.sonokai_diagnostic_virtual_text = "colored"

-- blue green red
vim.g.sonokai_menu_selection_background = "green"

vim.cmd([[colorscheme sonokai]])
