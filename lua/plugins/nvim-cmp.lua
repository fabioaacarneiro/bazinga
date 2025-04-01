return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
    },
    -- configuration starts here
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        -- icons for kind of completions
        local cmp_kinds = {
            Text = " ",
            Method = " ",
            Function = " ",
            Constructor = " ",
            Field = " ",
            Variable = " ",
            Class = " ",
            Interface = " ",
            Module = " ",
            Property = " ",
            Unit = " ",
            Value = " ",
            Enum = " ",
            Keyword = " ",
            Snippet = " ",
            Color = " ",
            File = " ",
            Reference = " ",
            Folder = " ",
            EnumMember = " ",
            Constant = " ",
            Struct = " ",
            Event = " ",
            Operator = " ",
            TypeParameter = " ",
        }

        cmp.setup({
            -- Completion sources
            sources = {
                { name = "nvim_lsp" }, -- LSP
                { name = "buffer" }, -- buffer
                { name = "path" }, -- file paths
                { name = "luasnip" }, -- snippets
                { name = "friendly-snippet" }, -- snippets
            },
            window = {
                completion = cmp.config.window.bordered({
                    winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
                }),
                documentation = cmp.config.window.bordered({
                    documentation = {
                        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
                    },
                }),
            },
            -- Key maps
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-u>"] = cmp.mapping.scroll_docs(4),
                ["<C-e>"] = cmp.mapping.close(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.locally_jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),

            -- auto completion
            snippet = {
                expand = function(args)
                    -- seting up for luasnip
                    require("luasnip/loaders/from_vscode").lazy_load()
                    require("luasnip").lsp_expand(args.body)
                end,
            },

            -- popup completion appearance
            completion = {
                autocomplete = { cmp.TriggerEvent.TextChanged },
            },
            formatting = {
                fields = { "kind", "abbr" },
                format = function(_, vim_item)
                    vim_item.kind = cmp_kinds[vim_item.kind] or ""

                    return vim_item
                end,
            },
        })
    end,
}
