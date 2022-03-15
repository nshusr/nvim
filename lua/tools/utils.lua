M = {
    path = {},
    str = {}
}

function M.path.join(...)
    local path_string = ""
    for _, path in ipairs({...}) do
        path_string = path_string .. path .. "/"
    end
    return path_string:sub(1, #path_string - 1)
end

function M.str.title(word)
    local s, _ = string.gsub(word, "^%l", string.upper)
    return s
end

return M
