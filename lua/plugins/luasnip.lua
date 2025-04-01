return {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
        -- load snippets from vscode
        require("luasnip.loaders.from_vscode").lazy_load()
        -- add to ruby rails snippets
        require("luasnip").filetype_extend("ruby", { "rails" })
    end,
}
