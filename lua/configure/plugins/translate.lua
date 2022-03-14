-- https://github.com/uga-rosa/translate.nvim
-- The plugin uses the translate-shell plugin by default, so you need to install this plugin
-- https://github.com/soimort/translate-shell
-- You can also choose to use deepl for translation, but it relies on curl and jq commands
-- https://curl.se/
-- https://github.com/stedolan/jq
-- With these tools, you can call deepl's api
-- https://www.deepl.com/en/docs-api/

local options = {
    default = {
        -- default: translate_shell
        -- deepl_free
        -- deepl_pro
        commond = "translate_shell",
        output = "floating"
    }
}

require("translate").setup(options)
