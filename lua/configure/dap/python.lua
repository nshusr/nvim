-- python3 -m pip install debugpy

return {
    adapters = {
        type = "executable",
        command = vim.u.python_interpreter_path,
        args = {"-m", "debugpy.adapter"}
    },
    configurations = {
        {
            type = "python",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            pythonPath = function()
                return vim.u.python_interpreter_path
            end
        }
    }
}
