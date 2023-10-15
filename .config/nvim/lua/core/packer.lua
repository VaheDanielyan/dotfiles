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
	use ('wbthomason/packer.nvim')
	use ('terryma/vim-multiple-cursors')
	use ('nvim-lua/plenary.nvim')
	use ('navarasu/onedark.nvim')
    use ({'neoclide/coc.nvim', branch = 'release'})
	use ('nvim-lualine/lualine.nvim')
	use ('nvim-tree/nvim-web-devicons')
	use ({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
	use ('ThePrimeagen/harpoon')
    use ('f-person/git-blame.nvim')
    use ('nvim-tree/nvim-tree.lua')
    use ('peterhoeg/vim-qml')

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
