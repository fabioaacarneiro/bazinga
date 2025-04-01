-- Map to exit insert mode with 'jk'
vim.keymap.set("i", "jk", "<esc>", { desc = "Exit from insert mode" })

-- window movimentation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to up window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to down window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- save file
vim.keymap.set({ "n", "i" }, "<C-s>", function()
    vim.api.nvim_command("write")
end, { desc = "force save all files", remap = true })

-- close all other buffers
-- vim.keymap.set("n", "<leader>bo", function()
--     local current_buf = vim.api.nvim_get_current_buf()
--     local buffers = vim.api.nvim_list_bufs()
--
--     for _, buf in ipairs(buffers) do
--         if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) then
--             local filetype = vim.api.nvim_get_option_value("filetype", { buf = buf })
--             if filetype ~= "snacks_picker_input" then
--                 vim.api.nvim_buf_delete(buf, { force = true })
--             end
--         end
--     end
-- end, { desc = "close others buffers", noremap = false, silent = true })

vim.keymap.set(
    { "i", "n", "t" },
    "<C-/>",
    "<C-\\><C-n>:lua Snacks.terminal()<CR>",
    { desc = "Open integrated terminal", noremap = false }
)

-- open sigature help
vim.keymap.set({ "n" }, "<Leader>k", function()
    vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = "toggle signature" })
