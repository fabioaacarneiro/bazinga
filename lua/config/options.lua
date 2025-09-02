local o = vim.o

vim.cmd([[autocmd FileType * set formatoptions-=ro]])
o.tabstop = 4
o.expandtab = true
o.softtabstop = 4
o.shiftwidth = 4
o.relativenumber = true

-- Desativa o texto virtual (aquele na direita da linha)
vim.diagnostic.config({
    virtual_text = true, -- Desativa o comentário lateral
    signs = true,        -- Usa símbolos na margem
    underline = true,    -- Sublinhar o erro
    update_in_insert = true,
    severity_sort = true,
    float = {
        source = "always", -- Mostra a origem do erro (Pyright, etc.)
        border = "rounded",
    },
})

-- Mostra diagnostics em popup flutuante automaticamente ao parar o cursor
-- vim.api.nvim_create_autocmd("CursorHold", {
--     callback = function()
--         vim.diagnostic.open_float(nil, { focus = false })
--     end,
-- })

-- vim.opt.updatetime = 250


-- remove fundos escuros que quebram o thema
local hl = vim.api.nvim_set_hl
hl(0, "SnackPicker", { bg = "NONE" })
hl(0, "FloatBorder", { bg = "NONE" })
hl(0, "WhichKeyNormal", { bg = "NONE" })
hl(0, "NormalFloat", { bg = "NONE" })
