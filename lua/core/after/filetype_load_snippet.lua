local path = require("tools.path")

-- Language: python Django template and Django snippets
vim.g.LoadHtmlSnippets = function()
    local root_dir = vim.fn.getcwd()
    local dir_name = vim.fn.expand("%:p:h:t")
    -- load django template snippets
    if dir_name == "templates" and vim.fn.filereadable(path.join(root_dir, "manage.py")) == 1 then
        vim.cmd("let g:vsnip_filetypes.html = ['python/django/template']")
    else
        vim.cmd("let g:vsnip_filetypes.html = []")
    end
end

vim.g.LoadPythonSnippets = function()
    local root_dir = vim.fn.getcwd()
    -- load django snippets
    if vim.fn.filereadable(path.join(root_dir, "manage.py")) == 1 then
        vim.cmd(
            [[
            let g:vsnip_filetypes.python = [
                \'python/django/models',
                \'python/django/admin',
                \'python/django/froms',
                \'python/django/tags',
                \'python/django/urls',
                \'python/django/views'
                \]
            ]]
        )
    else
        vim.cmd("let g:vsnip_filetypes.python = []")
    end
end

-- Language: ejs
vim.g.LoadEjsSnippets = function()
    vim.bo.filetype = "html"
    vim.cmd([[
        let g:vsnip_filetypes.html = ['ejs']
    ]])
end

vim.cmd("autocmd BufEnter *.html call LoadHtmlSnippets()")
vim.cmd("autocmd BufEnter *.ejs call LoadEjsSnippets()")
vim.cmd("autocmd BufEnter *.py call LoadPythonSnippets()")
