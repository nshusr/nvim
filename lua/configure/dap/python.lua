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
            pythonPath = "python3"
        },
        {
            type = "python",
            request = "launch",
            name = "Launch Django",
            program = vim.fn.getcwd() .. "/manage.py",
            pythonPath = "python3",
            args = {
                "runserver",
                "127.0.0.1:8001"
            },
            django = true
        }
    }
}
