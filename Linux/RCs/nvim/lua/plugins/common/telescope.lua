return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.3",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
        {
            "nvim-telescope/telescope-live-grep-args.nvim",
            version = "^1.0.0",
        },
    },
    config = function()
        local akiha = require("akiha")
        local telescope = require("telescope")
        local tsbuiltin = require("telescope.builtin")
        local actions = require("telescope.actions")
        local transform_mod = require("telescope.actions.mt").transform_mod
        local lga_actions = require("telescope-live-grep-args.actions")
        local lga_shortcuts = require("telescope-live-grep-args.shortcuts")
        local trouble = require("trouble")

        local dropdownConfig = {
            theme = "dropdown",
            mappings = {
                i = {
                    ["<ESC>"] = actions.close,
                },
            },
        }

        local cursorConfig = {
            theme = "cursor",
            layout_config = {
                width = 0.6,
                height = 0.4,
            },
            mappings = {
                i = {
                    ["<ESC>"] = actions.close,
                },
            },
        }

        local openQuickfixList = {}
        openQuickfixList.trouble = function(prompt_bufnr)
            trouble.open("quickfix")
        end
        openQuickfixList = transform_mod(openQuickfixList)

        local opts = {
            defaults = {
                mappings = {
                    i = {
                        ["<M-q>"] = actions.smart_send_to_qflist + openQuickfixList.trouble,
                        ["<Tab>"] = actions.toggle_selection,
                    },
                    n = {
                        ["<M-q>"] = actions.smart_send_to_qflist + openQuickfixList.trouble,
                        ["<Tab>"] = actions.toggle_selection,
                    },
                },
            },
            pickers = {
                find_files = dropdownConfig,
                buffers = dropdownConfig,
                lsp_references = cursorConfig,
                lsp_definitions = cursorConfig,
                lsp_implementations = cursorConfig,
            },
            extensions = {
                fzf = {
                    fuzzy = true, -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true, -- override the file sorter
                    case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                },
                live_grep_args = {
                    auto_quoting = true,
                    mappings = { -- extend mappings
                        i = {
                            ["<C-k>"] = lga_actions.quote_prompt(),
                            ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                        },
                    },
                },
            },
        }

        telescope.setup(opts)
        telescope.load_extension("fzf")
        telescope.load_extension("live_grep_args")

        local function grep_word()
            local text = akiha.getVisualSelection()
            tsbuiltin.grep_string({ search = text })
        end

        akiha.setKeymap("n", "<M-p>", tsbuiltin.builtin, { desc = "Telescope Builtin" })

        akiha.setKeymap("n", "<M-`>", tsbuiltin.lsp_document_symbols, { desc = "Telescope Document Symbols" })

        akiha.setKeymap("n", "<M-s>", tsbuiltin.current_buffer_fuzzy_find, { desc = "Telescope Fuzzy Find" })

        akiha.setKeymap("n", "<M-g>", tsbuiltin.grep_string, { desc = "Telescope Grep String" })
        akiha.setKeymap("v", "<M-g>", grep_word, { desc = "Telescope Grep Visual Selection" })

        akiha.setKeymap("n", "<M-e>", tsbuiltin.find_files, { desc = "Telescope Find Files" })

        akiha.setKeymap("n", "<M-r>", tsbuiltin.buffers, { desc = "Telescope Buffers" })

        akiha.setKeymap("n", "<M-z>", tsbuiltin.jumplist, { desc = "Telescope Jumplist" })

        akiha.setKeymap("v", "<M-s>", function()
            tsbuiltin.current_buffer_fuzzy_find({ default_text = akiha.getVisualSelection() })
        end, { desc = "Telescope Fuzzy Find (selection)" })

        akiha.setKeymap("n", "<M-f>", telescope.extensions.live_grep_args.live_grep_args, { desc = "Telescope Live Grep Args" })
    end,
}
