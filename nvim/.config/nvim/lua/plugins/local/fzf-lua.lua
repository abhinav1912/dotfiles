return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    config = function ()
        local fzf = require("fzf-lua")

        vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "[f]ind [f]ile" })
        vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "[f]uzzy [g]rep" })
        vim.keymap.set("n", "<leader>fk", fzf.keymaps, { desc = "[f]ind [k]eymaps" })
        vim.keymap.set("n", "<leader>fw", fzf.grep_cword, { desc = "[f]ind [w]ord" })
        vim.keymap.set("n", "<leader>fW", fzf.grep_cWORD, { desc = "[f]ind [W]ord" })
        vim.keymap.set("n", "<leader>fd", fzf.diagnostics_document, { desc = "[f]ind [d]iagnostics" })
        vim.keymap.set("n", "<leader>fo", fzf.oldfiles, { desc = "[f]ind [o]ldfiles" })
        vim.keymap.set("n", "<leader>/", fzf.lgrep_curbuf, { desc = "[/] grep current buffer" })
    end
}
