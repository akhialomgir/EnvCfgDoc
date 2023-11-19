return {
    "stevearc/conform.nvim",
    event = "VeryLazy",
    config = function()
        local opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                json = { "jq" },
                yaml = { "yamlfmt" },
            },
        }
        local akiha = require("akiha")
        local conform = require("conform")

        conform.formatters.jq = {
            prepend_args = { "--indent", "4" },
        }

        conform.setup(opts)

        local function format()
            conform.format({ async = true, lsp_fallback = true })
        end

        akiha.setKeymap("n", "<space>f", format, { desc = "Format Documents" })
        akiha.setKeymap("v", "<space>f", format, { desc = "Format Selection" })
    end,
}
