
require'nvim-treesitter.configs'.setup {
    ensure_installed = {"arduino", "bash", "c", "cpp", "cmake", "comment",
                        "cuda", "diff", "dockerfile", "devicetree", "git_config",
                        "git_rebase", "gitattributes", "gitcommit", "gitignore",
                        "lua", "markdown", "ninja", "proto", "python", "yaml",
                        "sql", "vim", "vimdoc", "hjson", "rust", "go", "json"},
    highlight = {
        enable = true,
    },
    indent = {
        enable = true
    }
}
