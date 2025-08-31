return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local lspconfig = require('lspconfig')
            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP Actions',
                callback = function(args)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {noremap = true, silent = true})
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {noremap = true, silent = true})
                end,
            })

            local cmp_nvim_lsp = require("cmp_nvim_lsp")

            local keymap = vim.keymap -- for conciseness
            local capabilities = cmp_nvim_lsp.default_capabilities()

            lspconfig.sourcekit.setup {
                filetypes = {"swift", "c", "cpp"},
                capabilities = capabilities,
                cmd = { "sourcekit-lsp" }
            }

            vim.diagnostic.config({
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = " ",
                        [vim.diagnostic.severity.WARN] = " ",
                        [vim.diagnostic.severity.HINT] = "󰠠 ",
                        [vim.diagnostic.severity.INFO] = " ",
                    },
                },
            })
            vim.lsp.config("*", {
                capabilities = capabilities,
            })
        end,
    }
}
