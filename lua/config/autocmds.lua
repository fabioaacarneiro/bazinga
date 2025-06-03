-- Autocmds are automatically loaded
-- Add any additional autocmds here

-- Define an autocmd group for the blade workaround
local augroup = vim.api.nvim_create_augroup("lsp_blade_workaround", { clear = true })

-- tiny diagnostis
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*",
    callback = function()
        vim.diagnostic.config({
            virtual_text = false,
            signs = true,
            underline = true,
        })
    end,
})

-- active formate on save with conform
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
    end,
})

-- Autocommand to temporarily change 'blade' filetype to 'php' when opening for LSP server activation
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = augroup,
    pattern = "*.blade.php",
    callback = function()
        vim.bo.filetype = "php"
    end,
})

-- Additional autocommand to switch back to 'blade' after LSP has attached
vim.api.nvim_create_autocmd("LspAttach", {
    pattern = "*.blade.php",
    callback = function(args)
        vim.schedule(function()
            -- Check if the attached client is 'intelephense'
            for _, client in ipairs(vim.lsp.get_clients()) do
                if client.name == "intelephense" and client.attached_buffers[args.buf] then
                    vim.api.nvim_set_option_value("filetype", "blade", { buf = args.buf })

                    -- update treesitter parser to blade
                    vim.api.nvim_set_option_value("syntax", "blade", { buf = args.buf })
                    break
                end
            end
        end)
    end,
})

-- make $ part of the keyword for php.
vim.api.nvim_exec2("autocmd FileType php set iskeyword+=$", {})
