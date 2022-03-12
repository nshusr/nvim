-- https://github.com/mfussenegger/nvim-lint

-- WARN: nvim-lint manually download the diagnostic tool to ensure that the tool is correctly enabled in the environment variables

-- pip3 install pylint
-- npm install -g eslint
-- ...

local utils = require("tools.utils")

require("lint").linters_by_ft = {
    python = {"pylint"}
    -- javascript = {"eslint"},
    -- typescript = {"eslint"},
    -- go = {"golangcilint"}
}

-- pylint：
require("lint.linters.pylint").args = {
    "-f",
    "json",
    "--rcfile=" .. utils.path.join(vim.u.nvim_lint_dir, "pylint.conf")
}

print(utils.path.join(vim.u.nvim_lint_dir, "pylint.conf"))

vim.cmd([[
au BufEnter * lua require('lint').try_lint()
au BufWritePost * lua require('lint').try_lint()
]])
