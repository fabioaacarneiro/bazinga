local map = vim.keymap.set

map("i", "jk", "<esc>", {})
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to up window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to down window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })
map({ "n", "i" }, "<C-s>", function()
    vim.api.nvim_command("write")
end, { desc = "force save all files", remap = true })
map({ "n", "x" }, "gy", '"+y', { desc = "Copiar para área de transferência" })
map({ "n", "x" }, "gp", '"+p', { desc = "Colar da área de transferência" })
map({ "n", "x" }, "gP", '"+P', { desc = "Colar da área de transferência antes do cursor" })
map(
    { "i", "n", "t" },
    "<C-\\>",
    "<C-\\><C-n>:lua Snacks.terminal()<CR>",
    { desc = "Open integrated terminal", noremap = false }
)
map({ "n" }, "<Leader>k", function()
    vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = "toggle signature" })

-- show diagnostic bind
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

function ShowDiagnostic()
    vim.diagnostic.open_float(nil, {
        focus = false,
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    })
end

map("n", "<C-k>", function()
    ShowDiagnostic()
end, { desc = "Open float diagnostic" })
