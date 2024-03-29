local opt = vim.opt
local cmd = vim.api.nvim_command

-- opt.timeoutlen = 200

opt.wrap = false
opt.clipboard = "unnamedplus"
opt.scrolloff = 999
opt.virtualedit = "block"
opt.inccommand = "split"
opt.colorcolumn = "80" 

opt.syntax = "ON"
opt.termguicolors = true
cmd('colorscheme gruvbox')
vim.api.nvim_set_hl(0, "ColorColumn", { bg = '#202020' })

opt.foldlevel = 9

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 0

opt.splitright = true

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpt()'

opt.conceallevel = 2
vim.g.table_mode_corner="|"

opt.completeopt = { 'menuone', 'noselect', 'noinsert' }
opt.shortmess = opt.shortmess + { c = true }
vim.api.nvim_set_option('updatetime', 300)

cmd([[
 set signcolumn=yes
 autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])