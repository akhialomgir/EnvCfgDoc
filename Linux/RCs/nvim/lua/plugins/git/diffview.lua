return {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    config = function()
        local akiha = require("akiha")
        akiha.createCommand("His", function()
            vim.cmd("DiffviewFileHistory %")
        end, { desc = "File History (Using Diffview)" })
    end,
}
