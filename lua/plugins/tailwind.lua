return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                tailwindcss = {
                    settings = {
                        tailwindCSS = {
                            experimental = {
                                classRegex = {
                                    "@?class\\(([^]*)\\)",
                                    "'([^']*)'",
                                },
                            },
                        },
                    },
                },
            },
        },
    },
}
