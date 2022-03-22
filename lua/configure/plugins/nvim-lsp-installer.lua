-- https://github.com/williamboman/nvim-lsp-installer

local lsp_installer_servers = require("nvim-lsp-installer.servers")

-- use cmp_nvim_lsp instead of built-in omnifunc for a stronger completion experience
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- WARN: lsp install manually write lsp configuration files

-- name   : https://github.com/williamboman/nvim-lsp-installer#available-lsps
-- config : https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

-- also note that the installed versions of nodejs and npm should be newer, too long versions will cause lsp to not work properly

local servers = {
    sumneko_lua = require("configure.lsp.sumneko_lua"),
    pyright = require("configure.lsp.pyright"),
    tsserver = require("configure.lsp.tsserver"),
    html = require("configure.lsp.html"),
    cssls = require("configure.lsp.cssls"),
    gopls = require("configure.lsp.gopls"),
    jsonls = require("configure.lsp.jsonls"),
    zeta_note = require("configure.lsp.zeta_note"),
    vuels = require("configure.lsp.vuels")
}

local function attach(client, bufnr)
    require("aerial").on_attach(client, bufnr)
    vim.u.keymap.func.register_buffer_key("nvim_lsp_installer")
end

-- automatically install or start LanguageServers
for server_name, server_options in pairs(servers) do
    local server_available, server = lsp_installer_servers.get_server(server_name)
    -- determine if the service is available
    if server_available then
        -- determine whether the service is ready, if it is ready, start the service
        server:on_ready(
            function()
                -- keybind
                server_options.on_attach = attach
                -- options config
                server_options.flags = {
                    debounce_text_changes = 150
                }
                -- instead of built-in omnifunc
                server_options.capabilities = capabilities
                server:setup(server_options)
            end
        )
        -- auto install if language server is not ready
        if not server:is_installed() then
            vim.notify("Install Language Server : " .. server_name, "WARN", {title = "Language Servers"})
            server:install()
        end
    end
end
