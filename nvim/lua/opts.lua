local opt = vim.opt
local cmd = vim.api.nvim_command

opt.syntax = "ON"
opt.termguicolors = true
cmd('colorscheme gruvbox')

opt.foldlevel = 9

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

opt.expandtab = false
opt.shiftwidth = 4
opt.softtabstop = 0
opt.tabstop = 4

opt.splitright = true

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpt()'

opt.conceallevel = 2

opt.completeopt = { 'menuone', 'noselect', 'noinsert' }
opt.shortmess = opt.shortmess + { c = true }
vim.api.nvim_set_option('updatetime', 300)

cmd([[
 set signcolumn=yes
 autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])