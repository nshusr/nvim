-- https://github.com/neovim/nvim-lspconfig

-- diagnostic style customization
vim.diagnostic.config(
    {
        virtual_text = {
            prefix = "●",
            source = "always"
        },
        float = {
            source = "always"
        },
        update_in_insert = false
    }
)
