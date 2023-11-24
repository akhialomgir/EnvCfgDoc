return {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    config = function()
        local akiha = require("akiha")
        akiha.createCommand("Gb", function()
            vim.cmd("Git blame --date=short")
        end, { desc = "Git Blame" })

        -- aka: who write this code? leader-w(ho)
        akiha.setKeymap("n", "<leader>w", ":Git blame  --date=short<CR>", { desc = "Git Blame" })
    end,
}
