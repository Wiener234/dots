local map = vim.api.nvim_set_keymap

-- map('i', 'gk', '<Esc>', {})				-- exit insert mode
map('v', 'gk', '<Esc>', {})				-- exit visual mode
map('t', 'gk', [[<C-\><C-n>]], {})		-- exit terminal mode
map('n', ';', '<C-w>', {})				-- move between windows
map('n', '<leader>f', ':FloatermToggle<CR>', {})-- open floaterm
map('n', '<leader>n', ':Files<CR>', {})			-- open fzf Files ./
-- map('n', 'N', ':Files ', {})			-- open fzf Files [user input]
map('n', '<leader>b', ':Buffers<CR>', {})
map('n', '<leader>gf', ':GFiles?<CR>', {})
map('n', '<leader>N', ':NvimTreeToggle<CR>', {})

vim.keymap.set("n", "<localleader>p", require("nabla").popup, {})
vim.keymap.set("n", "<localleader>s", require("nabla").toggle_virt, {})

vim.api.nvim_create_autocmd({'BufEnter', 'TermEnter'} , {
	callback = function ()
		if vim.bo.filetype == 'fzf' then
            vim.keymap.set('n', '<leader>n', function ()
				vim.api.nvim_command(':q')
			end, {})

			vim.keymap.set('n', '<leader>b', function ()
				vim.api.nvim_command(':q')
			end, {})
			
            vim.keymap.set('n', '<leader>gf', function ()
				vim.api.nvim_command(':q')
			end, {})
       else
            vim.keymap.set('n', '<leader>n', ':Files<CR>', {})			-- open fzf Files ./
	  -- vim.keymap.set('n', 'N', ':Files ', {})			-- open fzf Files [user input]
            vim.keymap.set('n', '<leader>b', ':Buffers<CR>', {})
            vim.keymap.set('n', '<leader>gf', ':GFiles?<CR>', {})
		end
	end,
})

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
  	-- Enable completion triggered by <c-x><c-o>
  	vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

  	-- Buffer local mappings.
  	-- See `:help vim.lsp.*` for documentation on any of the below functions
  	local opts = { buffer = ev.buf }
  	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  	vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  	vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
  	vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
  	vim.keymap.set('n', '<leader>wl', function()
  	  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  	end, opts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  	vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'gf', function()
  	  vim.lsp.buf.format { async = true }
  	end, opts)
	end,
})