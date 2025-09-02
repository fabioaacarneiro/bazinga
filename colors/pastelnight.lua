-- Tema: PastelNight
-- Estilo: Dark com cores pastéis suaves
vim.cmd("highlight clear")
vim.cmd("syntax reset")
vim.g.colors_name = "pastelnight"

local set = vim.api.nvim_set_hl

-- 🎨 Paleta Pastel
local colors = {
    bg       = "#1e1e2e",
    fg       = "#e0def4",
    fg_dark  = "#a0a0c0",
    bg_light = "#2e2e3e",

    red      = "#f28fad",
    green    = "#abe9b3",
    yellow   = "#fae3b0",
    blue     = "#96cdfb",
    magenta  = "#dDB6F2",
    cyan     = "#b5f4ee",
    orange   = "#f8bd96",
    comment  = "#6e6a86",
    border   = "#c3bac6",
    black    = "#181825",
    none     = "NONE",
}

-- 🌌 Editor
set(0, "Normal", { fg = colors.fg, bg = colors.bg })
set(0, "NormalFloat", { fg = colors.fg, bg = colors.bg_light })
set(0, "FloatBorder", { fg = colors.border, bg = colors.bg_light })
set(0, "CursorLine", { bg = "#2a2a3a" })
set(0, "CursorLineNr", { fg = colors.fg, bold = true })
set(0, "LineNr", { fg = colors.fg_dark })
set(0, "Visual", { bg = "#44415a" })
set(0, "Search", { bg = colors.yellow, fg = colors.bg })
set(0, "IncSearch", { bg = colors.orange, fg = colors.bg })

-- 📚 Sintaxe
set(0, "Comment", { fg = colors.comment, italic = true })
set(0, "String", { fg = colors.green })
set(0, "Number", { fg = colors.orange })
set(0, "Boolean", { fg = colors.orange })
set(0, "Keyword", { fg = colors.magenta, bold = true })
set(0, "Identifier", { fg = colors.blue })
set(0, "Function", { fg = colors.cyan })
set(0, "Type", { fg = colors.yellow })
set(0, "Statement", { fg = colors.magenta })
set(0, "Operator", { fg = colors.fg })
set(0, "Constant", { fg = colors.red })
set(0, "PreProc", { fg = colors.yellow })
set(0, "Special", { fg = colors.orange })

-- 🧠 Treesitter (se você usa)
set(0, "@variable", { fg = colors.fg_dark })
set(0, "@function", { fg = colors.cyan })
set(0, "@keyword", { fg = colors.magenta })
set(0, "@string", { fg = colors.green })
set(0, "@number", { fg = colors.orange })
set(0, "@comment", { fg = colors.comment, italic = true })
set(0, "@type", { fg = colors.yellow })
set(0, "@constant", { fg = colors.red })
set(0, "@constructor", { fg = colors.blue })
set(0, "@punctuation", { fg = colors.fg })

-- 🛠️ Diagnostic (LSP)
set(0, "DiagnosticError", { fg = colors.red })
set(0, "DiagnosticWarn", { fg = colors.yellow })
set(0, "DiagnosticInfo", { fg = colors.blue })
set(0, "DiagnosticHint", { fg = colors.cyan })
set(0, "DiagnosticUnderlineError", { undercurl = true, sp = colors.red })
set(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = colors.yellow })
set(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = colors.blue })
set(0, "DiagnosticUnderlineHint", { undercurl = true, sp = colors.cyan })

-- 📋 Menu de Completamento
set(0, "Pmenu", { bg = colors.bg_light, fg = colors.fg })
set(0, "PmenuSel", { bg = colors.blue, fg = colors.bg, bold = true })
set(0, "PmenuThumb", { bg = colors.comment })
set(0, "CmpItemAbbr", { fg = colors.fg })
set(0, "CmpItemAbbrMatch", { fg = colors.cyan, bold = true })
set(0, "CmpItemKind", { fg = colors.orange })

-- 📦 Snacks.nvim
set(0, "Snacks", { fg = colors.fg, bg = colors.bg_light })
set(0, "SnacksInput", { fg = colors.cyan, bg = colors.bg })
set(0, "SnacksScope", { fg = colors.green, bg = colors.bg_light })

-- 📈 Lualine (usado como base se quiser)
-- Define isso separadamente no seu lualine setup:
-- require("lualine").setup({ options = { theme = 'pastelnight' } })
-- Se quiser, posso gerar esse tema separado também.

-- 🗂️ Tabline
set(0, "TabLine", { fg = colors.fg_dark, bg = colors.bg_light })
set(0, "TabLineSel", { fg = colors.fg, bg = colors.blue, bold = true })
set(0, "TabLineFill", { bg = colors.bg })

-- 📘 Status de Diff/Git
set(0, "DiffAdd", { bg = "#294436" })
set(0, "DiffChange", { bg = "#3c3c2e" })
set(0, "DiffDelete", { bg = "#432a2a" })
set(0, "GitSignsAdd", { fg = colors.green })
set(0, "GitSignsChange", { fg = colors.yellow })
set(0, "GitSignsDelete", { fg = colors.red })
