return {
    "HiPhish/rainbow-delimiters.nvim",
    event = "VeryLazy",
    config = function()
        local rainbow_delimiters = require("rainbow-delimiters")
        local akiha = require("akiha")

        vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = akiha.color.red })
        vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = akiha.color.orange })
        vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = akiha.color.yellow })
        vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = akiha.color.violet })
        vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = akiha.color.green })
        vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = akiha.color.cyan })
        vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = akiha.color.blue })

        vim.g.rainbow_delimiters = {
            strategy = {
                [""] = rainbow_delimiters.strategy["global"],
                commonlisp = rainbow_delimiters.strategy["local"],
            },
            query = {
                [""] = "rainbow-delimiters",
                lua = "rainbow-blocks",
            },
            highlight = {
                "RainbowDelimiterOrange",
                "RainbowDelimiterYellow",
                "RainbowDelimiterViolet",
                "RainbowDelimiterGreen",
                "RainbowDelimiterCyan",
                "RainbowDelimiterBlue",
                "RainbowDelimiterRed",
            },
            blacklist = { "c", "cpp" },
        }
    end,
}
