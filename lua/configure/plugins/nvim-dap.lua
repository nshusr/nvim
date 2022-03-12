-- https://github.com/mfussenegger/nvim-dap

-- WARN: dap download the debugger manually
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation

local dap = require("dap")

-- set breakpoint style
vim.fn.sign_define("DapBreakpoint", {text = "⚫", texthl = "TodoFgFIX", linehl = "", numhl = ""})

-- load debugger configuration
local dap_config = {
    python = require("configure.dap.python"),
    go = require("configure.dap.go")
}

-- apply debugger configuration
for dap_name, dap_options in pairs(dap_config) do
    dap.adapters[dap_name] = dap_options.adapters
    dap.configurations[dap_name] = dap_options.configurations
end
