local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use({
        "aserowy/tmux.nvim",
        config = function() return require("tmux").setup() end
    })
    use('daeyun/vim-matlab')
    use ('wbthomason/packer.nvim')
    use ('Mofiqul/dracula.nvim')
    use ('tpope/vim-fugitive')
    use ('terryma/vim-multiple-cursors')
    use ('nvim-lua/plenary.nvim')
    use ({'neoclide/coc.nvim', branch = 'release'})
    use ('nvim-lualine/lualine.nvim')
    use ('nvim-tree/nvim-web-devicons')
    use ({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', branch = 'master'})
    use ('ThePrimeagen/harpoon')
    use ('f-person/git-blame.nvim')
    use ('nvim-tree/nvim-tree.lua')
    use { "ellisonleao/gruvbox.nvim" }
    use ('peterhoeg/vim-qml')
    use({"iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end,})
    use ('mrk21/yaml-vim')

    use ({ "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }})

    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use "olimorris/onedarkpro.nvim"

    use {
        'fei6409/log-highlight.nvim',
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
