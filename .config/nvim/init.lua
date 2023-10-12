--vim.api.nvim_command('source /home/daniev/.config/nvim/config.vim')
vim.api.nvim_command('source ~/.config/nvim/config.vim')

require('lualine').setup()

require'nvim-treesitter.configs'.setup {
    ensure_installed = {"arduino", "bash", "c", "cpp", "cmake", "comment",
                        "cuda", "diff", "dockerfile", "devicetree", "git_config",
                        "git_rebase", "gitattributes", "gitcommit", "gitignore",
                        "lua", "markdown", "ninja", "proto", "proto", "qmljs",
                        "qmldir", "sql", "vim", "vimdoc", "yaml", "hjson"},
    highlight = {
        enable = true,
    },
    indent = {
        enable = true
    }
}

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
---vim.keymap.set("n", "<leader>d", mark.remove_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
