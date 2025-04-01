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

-- fix to solarized-osaka theme
function FixSolarizerdOsaka(borderColor)
    local primaryLightFG
    local primaryLightBG = "NONE"
    local primaryDarkFG
    local primaryDarkBG = "#001419"

    if borderColor == "gold" then
        primaryLightFG = "#b28500"
        primaryDarkFG = "#805100"
    end

    if borderColor == "blue" then
        primaryLightFG = "#2491E4"
        primaryDarkFG = "#1C63AA"
    end

    vim.api.nvim_set_hl(0, "SnacksPickerBorder", { fg = primaryLightFG, bg = primaryLightBG })
    vim.api.nvim_set_hl(0, "SnacksPickerBoxBorder", { fg = primaryLightFG, bg = primaryLightBG })
    vim.api.nvim_set_hl(0, "SnacksPickerListBorder", { fg = primaryLightFG, bg = primaryLightBG })
    vim.api.nvim_set_hl(0, "SnacksNotifierBorderTrace", { fg = primaryLightFG, bg = primaryLightBG })
    vim.api.nvim_set_hl(0, "LspInfoBorder", { fg = primaryLightFG, bg = primaryLightBG })
    vim.api.nvim_set_hl(0, "MiniFilesBorder", { fg = primaryLightFG, bg = primaryLightBG })
    vim.api.nvim_set_hl(0, "MiniNotifyBorder", { fg = primaryLightFG, bg = primaryLightBG })
    vim.api.nvim_set_hl(0, "MiniPickerBorder", { fg = primaryLightFG, bg = primaryLightBG })
    vim.api.nvim_set_hl(0, "MiniPickerBorderFooter", { fg = primaryLightFG, bg = primaryLightBG })
    vim.api.nvim_set_hl(0, "WhichKeyBorder", { fg = primaryLightFG, bg = primaryLightBG })
    vim.api.nvim_set_hl(0, "CompDocumentationBorder", { fg = primaryLightFG, bg = primaryLightBG })
    vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = primaryLightFG, bg = primaryLightBG })
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = primaryLightFG, bg = primaryLightBG })
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = primaryLightFG, bg = primaryLightBG })
    vim.api.nvim_set_hl(0, "StatusLine", { fg = primaryDarkBG, bg = primaryLightFG })
    vim.api.nvim_set_hl(0, "StatusLineNC", { fg = primaryDarkBG, bg = primaryDarkFG })
end

-- adjust border color for solarized-osaka theme
-- only have two options: "gold" or "blue"
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        if vim.g.colors_name == "solarized-osaka" then
            FixSolarizerdOsaka("blue")
        end
    end,
})
