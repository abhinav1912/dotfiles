return {
    -- 'vintharas/fzf-codesearch.nvim',
    url = 'sso://user/aktau/fzf-citc.nvim',
    dependencies = { "ibhagwan/fzf-lua" },
    config = function()
        local fzfc = require("fzf-citc")

        vim.keymap.set("n", "<leader>cmf", fzfc.modified, { desc = "[C]itC [m]odified [f]iles picker" })
        vim.keymap.set("n", "<leader>cmd", fzfc.modified_dirs, { desc = "[C]itC [m]odified [d]irectory switcher" })
        vim.keymap.set("n", "<leader>cws", fzfc.workspaces, { desc = "[C]itC [w]orkspace [s]witcher" })
    end,
}
