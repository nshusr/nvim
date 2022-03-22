vim.g.FcitxToggleInput = function()
    local input_status = tonumber(vim.fn.system("fcitx-remote"))
    if input_status == 2 then
        vim.fn.system("fcitx-remote -c")
    end
end

vim.g.LoadHtmlSnippets = function()
    local root_dir = vim.fn.getcwd()
    local dir_name = vim.fn.expand("%:p:h:t")
    -- load django template snippets
    if dir_name == "templates" and vim.fn.filereadable(root_dir .. "/manage.py") == 1 then
        vim.cmd("let g:vsnip_filetypes.html = ['django-html']")
    else
        vim.cmd("let g:vsnip_filetypes.html = []")
    end
end

vim.g.LoadEjsSnippets = function()
    vim.cmd([[
        set filetype=html
        let g:vsnip_filetypes.html = ['ejs']
    ]])
end

vim.g.LoadPythonSnippets = function()
    local root_dir = vim.fn.getcwd()
    -- load django snippets
    if vim.fn.filereadable(root_dir .. "/manage.py") == 1 then
        vim.cmd(
            [[
            let g:vsnip_filetypes.python = [
            \'django-models', 
            \'django-admin',
            \'django-from',
            \'django-template',
            \'django-urls',
            \'django-views']
            ]]
        )
    else
        vim.cmd("let g:vsnip_filetypes.python = []")
    end
end

vim.cmd("autocmd InsertLeave * call FcitxToggleInput()")
vim.cmd("autocmd BufEnter *.html call LoadHtmlSnippets()")
vim.cmd("autocmd BufEnter *.ejs call LoadEjsSnippets()")
vim.cmd("autocmd BufEnter *.py call LoadPythonSnippets()")
