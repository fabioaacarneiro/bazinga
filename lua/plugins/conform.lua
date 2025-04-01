return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            go = { "goimports", "gotmt" },
        },
        format_on_save = {
            lsp_format = "falback",
            timout_ms = 1500,
        },
        format_after_save = {
            lsp_format = "falback",
        },
    },
}
