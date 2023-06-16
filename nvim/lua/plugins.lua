-- [[ plugins.lua ]]

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

  -- [[ Plugins ]]


  use { 'norcalli/nvim-colorizer.lua' }
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
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-commentary' }
  use { 'junegunn/fzf' }
  use { 'junegunn/fzf.vim' }
  use { 'honza/vim-snippets' }
  use { 'windwp/nvim-autopairs' }
  use { 'L3MON4D3/LuaSnip' }
  use { 'saadparwaiz1/cmp_luasnip'}



  -- [[ Themes ]] 

  use { 'Mofiqul/dracula.nvim' }
  use { 'morhetz/gruvbox' }





  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)






------------------------- Plugins to look into and add -----------------------------

-- [ ] vimspector -> graphical debugger
-- [ ] vim-surround -> souround with ()  '' "" [] {}
-- [x] ultisnips -> snippets for #!/bin/bash or other languages and stuff
