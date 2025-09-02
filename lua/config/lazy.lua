local lazyPath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazyPath) then
    local lazyRepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({"git", "clone", "--branch=stable", lazyRepo, lazyPath})

    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            {"Falha ao clonar o lazy.nvim:\n", "ErrorMsg"},
            {out},
            {"\nPressione qualquer tecla para sair..."},
        }, true, {})

        vim.fn.getchar()

        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazyPath)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({spec = {{import = "plugins"}}})