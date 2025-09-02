-- ~/.config/nvim/colors/mytheme.lua
vim.cmd("highlight clear")
vim.cmd("syntax reset")
vim.g.colors_name = "noctua"

local set = vim.api.nvim_set_hl

-- Core do editor
set(0, "Normal", { fg = "#555555", bg = "#1e1e1e" })
set(0, "CursorLine", { bg = "#333333" })
set(0, "LineNr", { fg = "#5c6370" })
set(0, "CursorLineNr", { fg = "#555555", bold = true })
set(0, "Comment", { fg = "#888888", italic = true })
set(0, "String", { fg = "#98c379" })
set(0, "Number", { fg = "#d19a66" })
set(0, "Keyword", { fg = "#c678dd", bold = true })
set(0, "Function", { fg = "#61afef" })
set(0, "Type", { fg = "#e5c07b" })

-- Diagnostics (LSP)
set(0, "DiagnosticError", { fg = "#e06c75" })
set(0, "DiagnosticWarn", { fg = "#e5c07b" })
set(0, "DiagnosticInfo", { fg = "#61afef" })
set(0, "DiagnosticHint", { fg = "#56b6c2" })

-- Popups flutuantes
set(0, "NormalFloat", { link = "NONE" })
set(0, "FloatBorder", { bg = "NONE", fg = "#89b4fa" })

-- Plugin: snacks.nvim (QoL)
-- snacks possui muitos highlights, use esse como base
set(0, "Snacks", { fg = "#c8c093", bg = "#1e1e2e" })
set(0, "SnacksInput", { fg = "#d4be98", bg = "#2e2e3e" })
set(0, "SnacksScope", { fg = "#8fbcbb", bg = "#1e1e2e" })
-- OBS: snacks.nvim permite usar picker para ver todos os highlights :contentReference[oaicite:0]{index=0}

-- Plugin: lualine.nvim
-- Personalize cada seção: a, b, c, x, y, z em modos normal/inativo
local custom_lualine = {
    normal = {
        a = { bg = "#3e4452", fg = "#ffffff" },
        b = { bg = "#2b2b2b", fg = "#8fbcbb" },
        c = { bg = "#1e1e2e", fg = "#81a1c1" },
    },
    inactive = { c = { bg = "#1e1e2e", fg = "#5c6370" } },
}
require("lualine").setup({
    options = {
        theme = custom_lualine,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
    }
})

-- Plugin: tabline (ex: built-in ou tabline plugin)
-- Utiliza highlights como TabLine, TabLineSel, TabLineFill
set(0, "TabLine", { fg = "#abb2bf", bg = "#2e2e3e" })
set(0, "TabLineSel", { fg = "#61afef", bg = "#1e1e2e", bold = true })
set(0, "TabLineFill", { bg = "#1e1e2e" })
set(0, "TabLineSeparatorSel", { fg = "#61afef", bg = "#1e1e2e" })
set(0, "TabLineSeparator", { fg = "#5c6370", bg = "#2e2e3e" })
-- Se usar Vem Tabline:
-- highlight VemTablineNormal, VemTablineSelected, etc. :contentReference[oaicite:1]{index=1}
