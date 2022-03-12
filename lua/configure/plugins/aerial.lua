-- https://github.com/stevearc/aerial.nvim

local options = {
    min_width = 30,
    -- backends = {"lsp", "treesitter", "markdown"}
    backends = {"treesitter", "markdown"},
    -- show all icons
    filter_kind = false,
    -- auto use lspkind-nvim or nvim-web-devicons
    nerd_font = "auto",
    update_events = "TextChanged,InsertLeave",
    on_attach = function(bufnr)
        vim.u.keymap.func.register_buffer_key("aerial", bufnr)
    end
}

require("aerial").setup(options)
