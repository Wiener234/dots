-- [[ plug.lua ]]

return require('packer').startup(function(use)
  -- [[ Plugins Go Here ]]
  
  use {                                              -- filesystem navigation
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'        -- filesystem icons
  }

  use { 'ap/vim-css-color' }
  --use { 'neoclide/coc.nvim', branch = 'release' }
  use { 'tc50cal/vim-terminal', 
         requires = 'kyazdani42/nvim-web-devicons'}
  use { 'norcalli/nvim-colorizer.lua' }
  use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}
  -- [[ Themes Go Here ]]
  use { 'Mofiqul/dracula.nvim' }                     -- colorscheme
  use {'andweeb/presence.nvim'}
  use {'arnarg/todotxt.nvim',
        requires = 'MunifTanjim/nui.nvim'}
  use {'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'}
--  use {'akinsho/bufferline.nvim', 
--        tag = "v2.*",
--        requires = 'kyazdani42/nvim-web-devicons'}     
  use {'lervag/vimtex'}

  --Rust plugins
  use 'williamboman/mason.nvim'    
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig' 
  use 'simrat39/rust-tools.nvim'

  -- Completion framework:
    use 'hrsh7th/nvim-cmp' 

    -- LSP completion source:
    use 'hrsh7th/cmp-nvim-lsp'

    -- Useful completion sources:
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'                             
    use 'hrsh7th/cmp-path'                              
    use 'hrsh7th/cmp-buffer'                            
    use 'hrsh7th/vim-vsnip'

    use 'voldikss/vim-floaterm'


end)
-- config = {package_root = vim.fn.stdpath('config') .. '/site/pack'})
