local function open_win_config_func()
    local scr_w = vim.opt.columns:get()
    local scr_h = vim.opt.lines:get()
    local tree_w = 80
    local tree_h = math.floor(tree_w * scr_h / scr_w)
    return {
	border = "double",
	relative = "editor",
	width = tree_w,
	height = tree_h,
	col = (scr_w - tree_w) / 2,
	row = (scr_h - tree_h) / 2
    }
end

local function get_width() 
    local winwidth = vim.api.nvim_win_get_width(0)
    print(winwidth)
    if winwidth <= 100 then
        return 30
    elseif winwidth <= 200 then
        return 40
    else
        return 50
    end
end

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        width = get_width,
        relativenumber = true,
        float = {
            enable = true,
            open_win_config = open_win_config_func
        }
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
    })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>fv", "<cmd>NvimTreeToggle<CR>", { desc = "[f]older [v]iew" }) -- toggle file explorer
    keymap.set("n", "<leader>ff", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "[f]ind [f]ile in explorer" }) -- toggle file explorer on current file
    keymap.set("n", "<leader>fr", "<cmd>NvimTreeRefresh<CR>", { desc = "[f]older view [r]efresh" }) -- refresh file explorer
  end,
}
