local utils = require("tools.utils")

---- user settings ----
vim.u = {}

vim.u.transparency_background = false
vim.u.platform_info = vim.bo.fileformat:upper()
vim.u.python_interpreter_path = "/usr/bin/python3"
vim.u.code_snippet_directory = utils.path.join(vim.fn.stdpath("config"), "snippet")
vim.u.nvim_lint_dir = utils.path.join(vim.fn.stdpath("config"), "lint")

---- plugin settings ----
vim.g.undotree_dir = utils.path.join(vim.fn.stdpath("cache"), "undotree")

vim.g.dbs = {
    {
        name = "dev",
        url = "mysql://askfiy@192.168.0.120/db1"
    },
    {
        name = "local",
        url = "mysql://root@localhost:3306/test"
    }
}
