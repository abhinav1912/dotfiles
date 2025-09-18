return {
    "yairhochner/google-snacks.nvim",
    url = "sso://user/yairhochner/google-snacks.nvim",
    lazy = false,
    dependencies = {
        "folke/snacks.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            picker = { enabled = true }, -- needed for pickers
            terminal = { enabled = true }, -- needed for submit terminal
            input = { enabled =  true }, -- needed for commit
        }
    },
    config = {}, -- add your config and customize here !
    keys = {
        { "<leader>hw",  function() require('google-snacks').citc.workspaces() end,        desc = "Fig Workspaces" },
        { "<leader>cw",  function() require('google-snacks').citc.create() end,            desc = "Create Workspace" },
        { "<leader>hx",  function() require('google-snacks').fig.xl() end,                 desc = "Fig XL" },
        { "<leader>hm",  function() require('google-snacks').fig.pstatus() end,            desc = "Hg Parent Diff" },
        { "<leader>hs",  function() require('google-snacks').fig.status() end,             desc = "Fig Diff" },
        { "<leader>hr",  function() require('google-snacks').fig.revstatus() end,          desc = "Fig Rev Status" },
        { "<leader>fg",  function() require('google-snacks').fig.grep() end,               desc = "Fig Grep" },
        { "<leader>co",  function() require('google-snacks').fig.commit() end,             desc = "Commit" },
        -- IMPORTANT : for the related_files picker to work, relatedfiles (vim plugin) is needed.
        { "<leader>rl",  function() require('google-snacks').nav.related_files() end,      desc = "Related Files" },
        { "<leader>cq",  function() require('google-snacks').codesearch.query() end,       desc = "codesearch query" },
        { "<leader>cf",  function() require('google-snacks').codesearch.query({ files = true, title = "codesearch - files" }) end,       desc = "codesearch files" },
        { "<leader>cqw", function() require('google-snacks').codesearch.word() end,        desc = "codesearch word" },
        { "<leader>cqv", function() require('google-snacks').codesearch.visual() end,       desc = "codesearch visual", mode = "v" }, -- important: enable the keymap only for visual mode
        { "<leader>cwf", function() require('google-snacks').codesearch.word({ files = true, title = "codesearch - word - files" }) end, desc = "codesearch word-file" },
        { "<leader>cl", function() require('google-snacks').comments.list() end, desc = "Comments" },
        { "<leader>clu", function() require('google-snacks').comments.list({resolved = false}) end, desc = "Comments (unresolved)" },
        -- Blaze keys
        { "<leader>b",   function() require('google-snacks').blaze.build() end,                        desc = "blaze build" },
        { "<leader>ba",  function() require('google-snacks').blaze.build({ on_pkg = true }) end,       desc = "blaze build current package" },
        { "<leader>bu",  function() require('google-snacks').blaze.build({ under_cursor = true }) end, desc = "blaze build under cursor" },
        { "<leader>ib",  function() require('google-snacks').blaze.build({ exec = "iblaze" }) end,     desc = "blaze build" },
        { "<leader>it",  function() require('google-snacks').blaze.test({ exec = "iblaze" }) end,      desc = "blaze build" },
        { "<leader>bt",  function() require('google-snacks').blaze.test() end,                         desc = "blaze test" },
        { "<leader>bta", function() require('google-snacks').blaze.test({ on_pkg = true }) end,        desc = "blaze test current package" },
        { "<leader>ut",  function() require('google-snacks').blaze.test({ under_cursor = true }) end,  desc = "blaze test under cursor" },
        { "<leader>tl",  function() require('google-snacks').blaze.targets() end,                      desc = "blaze targets" },
        { "<leader>bc",  function() require('google-snacks').blaze.commands() end,                     desc = "blaze commands" },
        { "<leader>bcl", function() require('google-snacks').blaze.build_cleaner() end,                desc = "build cleaner" },
    }
}
