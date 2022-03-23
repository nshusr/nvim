M = {}

function M.title(word)
    local s, _ = string.gsub(word, "^%l", string.upper)
    return s
end

return M
