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
