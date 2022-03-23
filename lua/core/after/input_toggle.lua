local options = require("core.options")

vim.g.FcitxToggleInput = function()
    local input_status = tonumber(vim.fn.system("fcitx-remote"))
    if input_status == 2 then
        vim.fn.system("fcitx-remote -c")
    end
end

if options.PLATFORM_INFO == "UNIX" then
    vim.cmd("autocmd InsertLeave * call FcitxToggleInput()")
end
