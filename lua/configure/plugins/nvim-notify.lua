-- https://github.com/rcarriga/nvim-notify

local options = {
    -- animation style
    -- • fade_in_slide_out
    -- • fade
    -- • slide
    -- • static
    stages = "fade",
    -- default: 5000
    timeout = 2000
}

if vim.u.transparency_background then
    options.background_colour = "#ffffff"
end

vim.notify = require("notify")

vim.notify.setup(options)

-- how to use
-- leveal: info、warn、error、debug、trace
-- demo:
-- vim.notify("hello world", "info", {title = "info"})
