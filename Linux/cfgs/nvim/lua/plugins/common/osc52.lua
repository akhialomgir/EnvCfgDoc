local akiha = require("akiha")
return {
    "ojroques/nvim-osc52",
    enabled = akiha.isRemote,
    config = function()
        local osc52 = require("osc52")

        osc52.setup({
            max_length = 0, -- Maximum length of selection (0 for no limit)
            silent = true, -- Disable message on successful copy
            trim = false, -- Trim surrounding whitespaces before copy
        })

        akiha.setKeymap("n", "<C-y>", osc52.copy_operator, { expr = true, desc = "OSC52 copy to clipboard" })
        akiha.setKeymap("v", "<C-y>", osc52.copy_visual, { desc = "OSC52 copy to clipboard" })
    end,
}
