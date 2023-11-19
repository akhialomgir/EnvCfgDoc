return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        local akiha = require("akiha")
        local opts = {
            window = {
                border = akiha.border,
            },
            layout = {
                height = { min = 10, max = 25 },
            },
        }
        local wk = require("which-key")
        wk.setup(opts)
    end,
}
