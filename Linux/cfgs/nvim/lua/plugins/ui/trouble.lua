return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
        local akiha = require("akiha")
        local trouble = require("trouble")
        local opts = {
            height = 15,
            padding = false,
            action_keys = {
                close_folds = { "zc" },
                open_folds = { "zo" },
            },
            win_config = { border = akiha.border },
        }

        trouble.setup(opts)

        akiha.setKeymap("n", "gq", function()
            trouble.open("document_diagnostics")
        end, { desc = "Trouble" })

        akiha.setKeymap("n", "<M-q>", function()
            trouble.toggle("quickfix")
        end, { desc = "Trouble Quickfix" })
    end,
}
