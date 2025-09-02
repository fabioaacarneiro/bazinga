local o = vim.o

vim.cmd([[autocmd FileType * set formatoptions-=ro]])
o.tabstop = 4
o.expandtab = true
o.softtabstop = 4
o.shiftwidth = 4
o.relativenumber = true

-- Desativa o texto virtual (aquele na direita da linha)
vim.diagnostic.config({
    virtual_text = false, -- Desativa o comentário lateral
    signs = true,         -- Usa símbolos na margem
    underline = true,     -- Sublinhar o erro
    update_in_insert = false,
    severity_sort = true,
    float = {
        source = "always", -- Mostra a origem do erro (Pyright, etc.)
        border = "rounded",
    },
})

-- Mostra diagnostics em popup flutuante automaticamente ao parar o cursor
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, { focus = false })
    end,
})

vim.opt.updatetime = 250

local signs = {
    Error = "",
    Warn  = "",
    Hint  = "󰌶",
    Info  = "",
}

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = signs.Error,
            [vim.diagnostic.severity.WARN]  = signs.Warn,
            [vim.diagnostic.severity.HINT]  = signs.Hint,
            [vim.diagnostic.severity.INFO]  = signs.Info,
        },
    },
})

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, {
            focus = false,
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        })
    end,
})

-- remove fundos escuros que quebram o thema
local hl = vim.api.nvim_set_hl
hl(0, "SnackPicker", { bg = "NONE" })
hl(0, "FloatBorder", { bg = "NONE" })
hl(0, "WhichKeyNormal", { bg = "NONE" })
hl(0, "NormalFloat", { bg = "NONE" })
