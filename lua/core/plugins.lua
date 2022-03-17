---@diagnostic disable: undefined-global
-- https://github.com/wbthomason/packer.nvim

local scripts = require("tools.scripts")
local utils = require("tools.utils")

Packer_bootstrap = scripts.packer.auto_install_packer()

local packer_install_plugins = {
    -------------
    --- basic ---
    -------------
    -- packer package manager
    {"wbthomason/packer.nvim"},
    -- optimized startup speed
    {"lewis6991/impatient.nvim", load_file = true},
    -- icon support
    {"kyazdani42/nvim-web-devicons", after = "impatient.nvim"},
    -- chinese documentation
    {"yianwillis/vimcdoc", event = {"BufRead", "BufNewFile"}},
    -- lua dependency
    {"nvim-lua/plenary.nvim", event = {"BufRead", "BufNewFile"}},
    -- character lookup
    {"BurntSushi/ripgrep", event = {"BufRead", "BufNewFile"}},
    -- file lookup
    {"sharkdp/fd", event = {"BufRead", "BufNewFile"}},
    -------------
    ---- lsp ----
    -------------
    -- lsp base plug-in
    {"neovim/nvim-lspconfig", load_file = true, event = {"BufRead", "BufNewFile"}},
    -- view tree
    {"stevearc/aerial.nvim", load_file = true, after = {"nvim-web-devicons", "nvim-lspconfig"}},
    -- replace the built-in omnifunc completion to get more completion
    {"hrsh7th/cmp-nvim-lsp", after = {"nvim-web-devicons", "nvim-lspconfig"}},
    -- download lsp automatically
    {"williamboman/nvim-lsp-installer", load_file = true, after = "cmp-nvim-lsp"},
    -- lsp progress prompts
    {"j-hui/fidget.nvim", load_file = true, after = "nvim-lsp-installer"},
    -- lsp ui beautification
    {"tami5/lspsaga.nvim", load_file = true, after = "nvim-lsp-installer"},
    -- extended lsp diagnostics
    {"mfussenegger/nvim-lint", load_file = true, after = "nvim-lsp-installer"},
    -- bulb hint code behavior
    {"kosayoda/nvim-lightbulb", load_file = true, after = "nvim-lsp-installer"},
    -- insert mode gets the function signature
    {"ray-x/lsp_signature.nvim", load_file = true, after = "impatient.nvim"},
    -------------
    -- complete -
    -------------
    -- git copilot is autocompleted
    {"github/copilot.vim", load_file = true, event = "InsertCharPre"},
    -- vsnip engine for code snippet support
    {"hrsh7th/vim-vsnip", event = {"InsertEnter", "CmdlineEnter"}},
    -- adds a vscode-like icon for completion
    {"onsails/lspkind-nvim", event = {"InsertEnter", "CmdlineEnter"}},
    -- code completion
    {"hrsh7th/nvim-cmp", load_file = true, after = {"lspkind-nvim", "vim-vsnip"}},
    -- source of code snippets for vsnip
    {"hrsh7th/cmp-vsnip", after = "nvim-cmp"},
    -- path completion
    {"hrsh7th/cmp-path", after = "nvim-cmp"},
    -- buffer completion
    {"hrsh7th/cmp-buffer", after = "nvim-cmp"},
    -- command completion
    {"hrsh7th/cmp-cmdline", after = "nvim-cmp"},
    -- sql completion
    {"kristijanhusak/vim-dadbod-completion", after = "nvim-cmp"},
    -- spelling suggestions
    {"f3fora/cmp-spell", after = "nvim-cmp"},
    -- provides code snippets in multiple languages
    {"rafamadriz/friendly-snippets", after = "nvim-cmp"},
    -- tabnine source that provides ai-based intelligent completion
    {"tzachar/cmp-tabnine", run = "./install.sh", after = "nvim-cmp", disable = false},
    -------------
    ---- dap ----
    -------------
    -- code debugging basic plugin
    {"mfussenegger/nvim-dap", load_file = true, event = {"BufRead", "BufNewFile"}},
    -- provides inline text for code debugging
    {"theHamsta/nvim-dap-virtual-text", load_file = true, after = "nvim-dap"},
    -- provides a ui interface for code debugging
    {"rcarriga/nvim-dap-ui", load_file = true, after = "nvim-dap"},
    -------------
    --- theme ---
    -------------
    -- excellent dark theme
    {"catppuccin/nvim", as = "catppuccin", disable = false, load_file = true},
    -- high contrast theme
    {"sainnhe/sonokai", disable = true, load_file = true},
    -- provides a default highlighting scheme for themes that do not support lsp highlighting
    {"folke/lsp-colors.nvim", load_file = true, event = {"BufRead", "BufNewFile"}},
    -- syntax highlighting
    {"nvim-treesitter/nvim-treesitter", load_file = true, event = {"BufRead", "BufNewFile"}},
    -- rainbow parentheses
    {"p00f/nvim-ts-rainbow", event = {"BufRead", "BufNewFile"}},
    -- provides contextual information for the status bar
    {"SmiteshP/nvim-gps", after = "nvim-treesitter"},
    -- git plugin
    {"lewis6991/gitsigns.nvim", load_file = true, after = {"nvim-treesitter", "plenary.nvim"}},
    -- lightweight status bar plugin
    {"nvim-lualine/lualine.nvim", load_file = true, after = {"nvim-gps", "gitsigns.nvim", "nvim-web-devicons"}},
    -- beautiful pop-ups
    {"rcarriga/nvim-notify", load_file = true, event = {"BufRead", "BufNewFile"}},
    -- displays the scroll bar
    {"petertriho/nvim-scrollbar", load_file = true, event = {"BufRead", "BufNewFile"}},
    -- displays the same word under the cursor
    {"RRethy/vim-illuminate", load_file = true, event = {"BufRead", "BufNewFile"}},
    -------------
    --- code ----
    -------------
    -- comment dependencies
    {"JoosepAlviste/nvim-ts-context-commentstring", event = {"BufRead", "BufNewFile"}},
    -- code comments
    {"numToStr/Comment.nvim", load_file = true, after = "nvim-ts-context-commentstring"},
    -- code formatting
    {"sbdchd/neoformat", load_file = true, cmd = "Neoformat"},
    -- quickly change words
    {"AndrewRadev/switch.vim", load_file = true, event = {"BufRead", "BufNewFile"}},
    -- python indentation
    {"Vimjas/vim-python-pep8-indent", ft = "python"},
    -- emmet abbreviation
    {"mattn/emmet-vim", ft = {"html", "javascript", "typescript", "vue", "xml"}},
    -- sql linking base plugin
    {"tpope/vim-dadbod", cmd = "DBUIToggle"},
    -- sql link ui plugin
    {"kristijanhusak/vim-dadbod-ui", load_file = true, after = "vim-dadbod"},
    -- package modification
    {"ur4ltz/surround.nvim", load_file = true, event = {"BufRead", "BufNewFile"}},
    -- automatically matches parentheses
    {"windwp/nvim-autopairs", load_file = true, event = "InsertEnter"},
    -- todo tree
    {"folke/todo-comments.nvim", load_file = true, event = {"BufRead", "BufNewFile"}},
    -- displays indentation lines
    {"lukas-reineke/indent-blankline.nvim", load_file = true, event = {"BufRead", "BufNewFile"}},
    -------------
    -- function -
    -------------
    -- deleting buffer does not affect existing layouts
    {"famiu/bufdelete.nvim", event = {"BufRead", "BufNewFile"}},
    -- supports the buffer bar for lsp status
    {"akinsho/bufferline.nvim", load_file = true, after = {"nvim-web-devicons", "bufdelete.nvim"}},
    -- file tree
    {"kyazdani42/nvim-tree.lua", load_file = true, cmd = {"NvimTreeToggle", "NvimTreeFindFile"}},
    -- undo tree
    {"mbbill/undotree", load_file = true, event = {"BufRead", "BufNewFile"}},
    -- fuzzy lookup
    {"nvim-telescope/telescope.nvim", load_file = true, cmd = "Telescope"},
    -- alternate
    {"nvim-pack/nvim-spectre", load_file = true, after = {"ripgrep", "plenary.nvim"}},
    -- markdown preview
    {"davidgranstrom/nvim-markdown-preview", load_file = true, ft = "markdown"},
    -- built-in terminal
    {"akinsho/toggleterm.nvim", load_file = true, event = {"BufRead", "BufNewFile"}},
    -- multi-cursor mode
    {"terryma/vim-multiple-cursors", load_file = true},
    -- auto save
    {"Pocco81/AutoSave.nvim", load_file = true, event = {"TextChanged", "TextChangedI"}},
    -- automatically restores the cursor position
    {"ethanholz/nvim-lastplace", load_file = true, event = {"BufRead", "BufNewFile"}},
    -- displays entries when searching
    {"kevinhwang91/nvim-hlslens", event = {"BufRead", "BufNewFile"}},
    -- displays the web color
    {"norcalli/nvim-colorizer.lua", load_file = true, event = {"BufRead", "BufNewFile"}},
    -- quick jumps
    {"phaazon/hop.nvim", load_file = true, cmd = {"HopWord", "HopLine", "HopChar1"}},
    -- spell checker
    {"lewis6991/spellsitter.nvim", load_file = true, event = {"BufRead", "BufNewFile"}},
    -- key binder
    {"folke/which-key.nvim", load_file = true, event = {"BufRead", "BufNewFile"}},
    -- translation plugins
    {"uga-rosa/translate.nvim", load_file = true, cmd = "Translate", disable = false},
    -- long screenshot of the code
    {"kristijanhusak/vim-carbon-now-sh", cmd = "CarbonNowSh"},
    -- query the startup time
    {"dstein64/vim-startuptime", cmd = "StartupTime"}
}

local packer = require("packer")

packer.init(
    -- don't delete disabled plugins on sync
    {
        auto_clean = false
    }
)

packer.startup(
    {
        function(use)
            for _, plugin in ipairs(packer_install_plugins) do
                if plugin.load_file then
                    local require_path
                    if plugin.as then
                        require_path = utils.path.join("configure", "plugins", plugin.as)
                    else
                        require_path = utils.path.join("configure", "plugins", string.match(plugin[1], "/([%w-_]+).?"))
                    end
                    plugin.config = "require('" .. require_path .. "')"
                end
                use(plugin)
            end
            if Packer_bootstrap then
                require("packer").sync()
            end
        end,
        config = {
            display = {
                open_fn = require("packer.util").float
            }
        }
    }
)

vim.cmd(
    [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]
)

return packer
