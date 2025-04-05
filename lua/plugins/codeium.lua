return {
    {
        "Exafunction/codeium.nvim",
        cmd = "Codeium",
        event = "InsertEnter",
        build = ":Codeium Auth",
        opts = {
            enable_cmp_source = vim.g.ai_cmp,
            virtual_text = {
                enabled = not vim.g.ai_cmp,
                key_bindings = {
                    accept = false, -- handled by nvim-cmp / blink.cmp
                    next = "<M-]>",
                    prev = "<M-[>",
                },
            },
        },
    },

    vim.g.ai_cmp and {
        "saghen/blink.cmp",
        optional = true,
        dependencies = { "codeium.nvim", "saghen/blink.compat" },
        opts = {
            sources = {
                compat = { "codeium" },
                providers = {
                    codeium = {
                        kind = "Codeium",
                        score_offset = 100,
                        async = true,
                    },
                },
            },
        },
    } or nil,
}
