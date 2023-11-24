return {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    config = function()
        local akiha = require("akiha")

        require("toggleterm").setup({
            size = function(term)
                if term.direction == "horizontal" then
                    return 20
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
            float_opts = {
                border = akiha.border,
            },
        })

        akiha.createAutocmd("TermOpen", {
            pattern = "*",
            callback = function()
                akiha.setBufKeymap(0, "t", "<ESC>", [[<C-\><C-n>]], { desc = "Close Terminal" })
                akiha.setBufKeymap(0, "n", "<ESC>", "<CMD>close<CR>", { desc = "Clse Terminal" })
                akiha.setBufKeymap(0, "t", "<C-w>", [[<C-\><C-n><C-w>]], { desc = "Terminal Mode Swich Window" })
            end,
        })

        local Terminal = require("toggleterm.terminal").Terminal

        local normalTerminal = Terminal:new({
            cmd = vim.o.shell,
            dir = vim.fn.expand("%:p:h"),
            direction = "float",
            float_opts = {
                border = akiha.border,
            },
            on_open = function(term)
                vim.cmd("startinsert!")
                akiha.setBufKeymap(term.bufnr, "t", "<M-\\>", "<cmd>close<CR>", { desc = "Close Terminal" })
            end,
        })

        akiha.setKeymap("n", "<M-\\>", function()
            normalTerminal:toggle()
        end, { desc = "Toggle Terminal" })

        local lazygit = Terminal:new({
            cmd = "lazygit",
            dir = "git_dir",
            direction = "float",
            float_opts = {
                border = akiha.border,
            },

            on_open = function(term)
                vim.cmd("startinsert!")
                akiha.setBufKeymap(term.bufnr, "n", "q", "<cmd>close<CR>", { desc = "Close Terminal" })
            end,
        })

        local function lazygit_toggle()
            lazygit:toggle()
        end

        akiha.createCommand("Lg", lazygit_toggle, { desc = "Lazygit" })
    end,
}
