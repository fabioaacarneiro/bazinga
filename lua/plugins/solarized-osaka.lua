return {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        transparent = true,
        terminal_colors = true,
        -- style options: storm, night, day
        style = "night",
        styles = {
            comments = { italic = true },
            keywords = { italic = true },
            functions = { bold = true },
            variables = {},
            sidebars = "transparent",
            floats = "transparent",
        },
        sidebars = { "qf", "help" },
        day_brightness = 0.3,
        hide_inactive_statusline = false,
        dim_inactive = false,
        lualine_bold = false,
    },
}
