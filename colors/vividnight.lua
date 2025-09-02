vim.cmd("highlight clear")
vim.cmd("syntax reset")
vim.g.colors_name = "vividnight"

local set = vim.api.nvim_set_hl

-- 🎨 Paleta de cores baseada na imagem enviada
local colors = {
    bg      = "#1a1a1a",
    bg_alt  = "#2a2a2a",
    border  = "#3a3a3a",
    fg      = "#d4d4d4",
    fg_dark = "#999999",
    comment = "#777777",

    pink    = "#dd5dab", -- Strings, Constants
    blue    = "#4a90d9", -- Functions, Keywords
    yellow  = "#f4b731", -- Types, Variables
    magenta = "#db2e65", -- Statements, Booleans
    orange  = "#eb4d26", -- Numbers, Operators
    violet  = "#4b4ea3", -- Preproc, Special
}

-- 🌌 Editor
set(0, "Normal", { fg = colors.fg_dark, bg = colors.bg })
set(0, "NormalFloat", { fg = colors.fg_dark, bg = colors.bg })
set(0, "FloatBorder", { fg = colors.border, bg = colors.bg })
set(0, "CursorLine", { bg = "#222222" })
set(0, "CursorLineNr", { fg = colors.fg, bold = true })
set(0, "LineNr", { fg = "#555555" })
set(0, "Visual", { bg = "#444444" })
set(0, "Search", { bg = colors.yellow, fg = colors.bg, bold = true })
set(0, "IncSearch", { bg = colors.orange, fg = colors.bg, bold = true })
set(0, "WinSeparator", { fg = "#3a3a3a", bg = "NONE" })

-- 🧠 Sintaxe
set(0, "Comment", { fg = colors.comment, italic = true })
set(0, "String", { fg = colors.pink })
set(0, "Constant", { fg = colors.pink })
set(0, "Function", { fg = colors.blue })
set(0, "Identifier", { fg = colors.blue })
set(0, "Type", { fg = colors.yellow })
set(0, "Statement", { fg = colors.magenta })
set(0, "Keyword", { fg = colors.blue, bold = true })
set(0, "Boolean", { fg = colors.magenta })
set(0, "Number", { fg = colors.orange })
set(0, "Operator", { fg = colors.orange })
set(0, "PreProc", { fg = colors.violet })
set(0, "Special", { fg = colors.violet })

-- 🧠 Treesitter
set(0, "@string", { fg = colors.pink })
set(0, "@variable", { fg = colors.fg })
set(0, "@function", { fg = colors.blue })
set(0, "@keyword", { fg = colors.blue })
set(0, "@constant", { fg = colors.pink })
set(0, "@number", { fg = colors.orange })
set(0, "@boolean", { fg = colors.magenta })
set(0, "@type", { fg = colors.yellow })
set(0, "@comment", { fg = colors.comment, italic = true })
set(0, "@operator", { fg = colors.orange })

-- ⚠️ Diagnostic
set(0, "DiagnosticError", { fg = colors.magenta })
set(0, "DiagnosticWarn", { fg = colors.yellow })
set(0, "DiagnosticInfo", { fg = colors.blue })
set(0, "DiagnosticHint", { fg = colors.violet })
set(0, "DiagnosticUnderlineError", { undercurl = true, sp = colors.magenta })
set(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = colors.yellow })
set(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = colors.blue })
set(0, "DiagnosticUnderlineHint", { undercurl = true, sp = colors.violet })

-- 📋 Menu de Completamento (nvim-cmp)
set(0, "Pmenu", { bg = colors.bg_alt, fg = colors.fg })
set(0, "PmenuSel", { bg = colors.blue, fg = colors.bg, bold = true })
set(0, "PmenuThumb", { bg = "#444444" })
set(0, "CmpItemAbbr", { fg = colors.fg })
set(0, "CmpItemAbbrMatch", { fg = colors.cyan, bold = true })
set(0, "CmpItemKind", { fg = colors.orange })

-- 🧪 Snacks
set(0, "Snacks", { fg = colors.fg, bg = colors.bg_alt })
set(0, "SnacksInput", { fg = colors.yellow, bg = colors.bg })
set(0, "SnacksScope", { fg = colors.magenta, bg = "NONE" })
set(0, "SnacksPicker", { bg = "NONE" })

-- 📊 Lualine
set(0, "StatusLine", { fg = colors.fg, bg = colors.bg_alt })
set(0, "StatusLineNC", { fg = colors.comment, bg = colors.bg_alt })

-- 🗂️ Tabline
set(0, "TabLine", { fg = colors.comment, bg = colors.bg_alt })
set(0, "TabLineSel", { fg = colors.fg, bg = colors.blue, bold = true })
set(0, "TabLineFill", { bg = colors.bg })

-- 📁 Git e Diff
set(0, "DiffAdd", { bg = "#1e3a2e" })
set(0, "DiffChange", { bg = "#3a3a2e" })
set(0, "DiffDelete", { bg = "#3a1e1e" })
set(0, "GitSignsAdd", { fg = colors.green })
set(0, "GitSignsChange", { fg = colors.yellow })
set(0, "GitSignsDelete", { fg = colors.magenta })

-- Wichkey
set(0, "WichkeyNormal", { fg = "NONE" })
