local path = require("tools.path")

M = {}

M.PLATFORM_INFO = vim.bo.fileformat:upper()
M.TRANSPARENCY_BACKGROUND = true
M.PYTHON_INTERPRETER_PATH = "/usr/bin/python3"
M.CODE_SNIPPET_DIRECTORY = path.join(vim.fn.stdpath("config"), "snippets")
M.NVIM_LINT_DIR = path.join(vim.fn.stdpath("config"), "lint")
M.DATABASE_CONFIG = {
    {
        name = "dev",
        url = "mysql://askfiy@192.168.0.120/db1"
    },
    {
        name = "local",
        url = "mysql://root@localhost:3306/test"
    }
}
M.CODE_SNIPPET_FILETYPES = {
    javascript = {"typescript"},
    typescript = {"javascript"},
    vue = {"javascript", "typescript"},
    html = {},
    python = {}
}

vim.g.vsnip_snippet_dir = M.CODE_SNIPPET_DIRECTORY
vim.g.vsnip_filetypes = M.CODE_SNIPPET_FILETYPES
vim.g.dbs = M.DATABASE_CONFIG

return M
