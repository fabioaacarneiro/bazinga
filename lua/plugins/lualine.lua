return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        function(_, opts)
            table.insert(opts.sections.lualine_x, 2, LazyVim.lualine.cmp_source("codeium"))
        end,
    },
}
