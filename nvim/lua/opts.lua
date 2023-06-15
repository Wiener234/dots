-- [[ opts.lua ]]
local opt = vim.opt
local cmd = vim.api.nvim_command

-- [[ Theme ]]
opt.syntax = "ON"
opt.termguicolors = true
cmd('colorscheme gruvbox')

-- [[ Folds ]]
cmd('set foldlevel=9')

-- [[ Search ]]
opt.ignorecase = true		-- bool: Ignore case in search patterns
opt.smartcase = true		-- bool: Override ingnorecase if search contains capitals
opt.incsearch = true		-- bool: Use incremental search
opt.hlsearch = true		-- bool: Highlight search matches

-- [[ Whitespaces ]] 
opt.expandtab = false		-- bool: Use spaces instead of tabs
opt.shiftwidth = 4		-- num: Size of indent
opt.softtabstop = 4		-- num: Number of spaces tabs count for in insert mode
opt.tabstop = 4			-- num: Number of spaces tabs count for

-- [[ Splits ]]
opt.splitright = true 		-- bool: Place new window to right of current one

-- [[ Treesitter ]]
vim.wo.foldmethod = 'expr'	-- ?
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

-- [[ CMD ]]
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortmess: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
opt.completeopt = { 'menuone', 'noselect', 'noinsert' }
opt.shortmess = opt.shortmess + { c = true }
vim.api.nvim_set_option('updatetime', 300)


-- Fixed column for diagnostics to appear
-- Show auto diagnostic popup on cursor hover_range
-- Goto previus / next diagnostic warnign / error
-- Show inlay_hints more frequently
cmd([[
	set signcolumn=yes
	autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])
