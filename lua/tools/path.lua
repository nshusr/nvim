M = {}

function M.join(...)
    local path_string = ""
    for _, path in ipairs({...}) do
        path_string = path_string .. path .. "/"
    end
    return path_string:sub(1, #path_string - 1)
end

return M
