return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim", opts = {} },
        "williamboman/mason-lspconfig.nvim",
        { "j-hui/fidget.nvim",       opts = {} },
        "hrsh7th/cmp-nvim-lsp",
    },
    opts = {
        -- @type lspconfig.options
        servers = {
            emmet_ls = {
                filetypes = {
                    "astro",
                    "blade",
                    "css",
                    "eruby",
                    "html",
                    "htmldjango",
                    "javascriptreact",
                    "less",
                    "pug",
                    "sass",
                    "scss",
                    "svelte",
                    "typescriptreact",
                    "vue",
                    "erb",
                },
            },
        },
    },
    config = function()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

        -- setup for lua lsp
        require("lspconfig").lua_ls.setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    completion = {
                        callSnippet = "Replace",
                    },
                    diagnostic = {
                        globals = { 'vim' }
                    }
                },
            },
        })

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
            callback = function(event)
                local map = function(keys, func, desc, mode)
                    mode = mode or "n"
                    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                end

                map("gd", function()
                    Snacks.picker.lsp_definitions()
                end, "[G]oto [D]efinition")
                map("gr", function()
                    Snacks.picker.lsp_references()
                end, "[G]oto [R]eferences")
                map("gI", function()
                    Snacks.picker.lsp_references()
                end, "[G]oto [I]mplementation")
                map("<leader>D", function()
                    Snacks.picker.lsp_declarations()
                end, "[G]oto [D]eclaration")
                map("<leader>ds", function()
                    Snacks.picker.lsp_symbols()
                end, "[D]ocument [S]ymbols")
                map("<leader>ws", function()
                    Snacks.picker.lsp_workspace_symbols()
                end, "[W]orkspace [S]ymbols")
                map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
                map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
                map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

                local client = vim.lsp.get_client_by_id(event.data.client_id)

                -- Set capabilities for the client
                if client then
                    client.config.capabilities =
                        vim.tbl_deep_extend("force", client.config.capabilities or {}, capabilities)
                end
            end,
        })

        -- Configuração de Diagnósticos
        vim.diagnostic.config({
            severity_sort = true,
            float = { border = "rounded", source = "if_many" },
            virtual_text = {
                source = "if_many",
            },
        })

        -- Configuração de LSP
        local servers = {
            clangd = {},
            gopls = {},
            ts_ls = {},
            lua_ls = {
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = "Replace",
                        },
                        diagnostic = {
                            globals = {
                                'vim',
                            }
                        }
                    },
                },
            },
        }

        -- Configuração do Mason para garantir que os servidores LSP estejam instalados
        local ensure_installed = vim.tbl_keys(servers)
        require("mason-lspconfig").setup({
            ensure_installed = ensure_installed,
            automatic_installation = true,
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                    require("lspconfig")[server_name].setup(server)
                end,
            },
        })
    end,
}
