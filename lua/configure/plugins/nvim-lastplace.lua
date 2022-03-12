-- https://github.com/ethanholz/nvim-lastplace

local options = {
    lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
    lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
    lastplace_open_folds = true
}

require("nvim-lastplace").setup(options)
