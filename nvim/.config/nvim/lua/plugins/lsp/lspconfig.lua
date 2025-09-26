return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
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

            vim.lsp.config("sourcekit", {
                filetypes = {"swift", "c", "cpp"},
                capabilities = capabilities,
                cmd = { "sourcekit-lsp" }
            })


            vim.lsp.config['lua_ls'] = {
                -- Command and arguments to start the server.
                cmd = { 'lua-language-server' },

                -- Filetypes to automatically attach to.
                filetypes = { 'lua' },

                -- Sets the "root directory" to the parent directory of the file in the
                -- current buffer that contains either a ".luarc.json" or a
                -- ".luarc.jsonc" file. Files that share a root directory will reuse
                -- the connection to the same LSP server.
                -- Nested lists indicate equal priority, see |vim.lsp.Config|.
                root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },

                -- Specific settings to send to the server. The schema for this is
                -- defined by the server. For example the schema for lua-language-server
                -- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                        }
                    }
                }
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
            vim.lsp.enable("sourcekit")
            vim.lsp.enable("lua_ls")
        end,
    }
}
