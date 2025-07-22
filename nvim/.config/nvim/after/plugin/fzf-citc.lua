local fzfc = require("fzf-citc")

if not fzfc then return end

vim.keymap.set("n", "<leader>cmf", fzfc.modified, { desc = "fuzzy CitC modified files picker" })
vim.keymap.set("n", "<leader>cmd", fzfc.modified_dirs, { desc = "fuzzy CitC modified directory switcher" })
vim.keymap.set("n", "<leader>cws", fzfc.workspaces, { desc = "fuzzy CitC workspace switcher" })
