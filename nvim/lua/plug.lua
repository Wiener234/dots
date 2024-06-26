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
  use 'wbthomason/packer.nvim'

-- use { 'norcalli/nvim-colorizer.lua' }
use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
use { 'andweeb/presence.nvim' }
use { 'williamboman/mason.nvim' }
use { 'williamboman/mason-lspconfig.nvim' }
use { 'neovim/nvim-lspconfig' }
use { 'hrsh7th/nvim-cmp' }
use { 'hrsh7th/cmp-nvim-lsp' }
use { 'hrsh7th/cmp-path' }
use { 'hrsh7th/vim-vsnip' }
use { 'hrsh7th/cmp-nvim-lua' }
use { 'hrsh7th/cmp-buffer' }
use { 'hrsh7th/cmp-nvim-lsp-signature-help' }
use { 'voldikss/vim-floaterm' }
-- use { 'kylechui/nvim-surround' }
use { 'echasnovski/mini.surround'}
use { 'tpope/vim-commentary' }
use { 'junegunn/fzf' }
use { 'junegunn/fzf.vim' }
use { 'honza/vim-snippets' }
use { 'windwp/nvim-autopairs' }
use { 'L3MON4D3/LuaSnip' }
use { 'saadparwaiz1/cmp_luasnip'}
use { 'lervag/vimtex'}
use { 'nvim-neorg/neorg', run = ':Neorg sync-parsers', requires = 'nvim-lua/plenary.nvim' }
use { 'jbyuki/nabla.nvim' } 
use { 'max397574/better-escape.nvim', config = function() require('better_escape').setup() end,}
use { 'dhruvasagar/vim-table-mode'}
use { 'mfussenegger/nvim-dap'}
use { 'jay-babu/mason-nvim-dap.nvim' }
use { 'mfussenegger/nvim-jdtls' }
use { 'rcarriga/nvim-dap-ui', requires = {'mfussenegger/nvim-dap'} }
use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' }}
use { '3rd/image.nvim' }
use { 'kaarmu/typst.vim', ft = {'typst'} }
use { 'altermo/nxwm' }
use { 'sourcegraph/sg.nvim', run = 'nvim -l build/init.lua' }
use { 'nvim-lua/plenary.nvim' }

use { 'Mofiqul/dracula.nvim' }
use { "ellisonleao/gruvbox.nvim" }

  if packer_bootstrap then
    require('packer').sync()
  end
end)