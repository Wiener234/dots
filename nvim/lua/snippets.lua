-- [[ Snippets ]]

local ls = require('luasnip')

require('luasnip.loaders.from_lua').load( { paths = '~/.config/nvim/snippets/' } )

ls.config.set_config({
	history = true,
	updateevents = 'TextChanged,TextChangedI',
	enable_autosnippets = true,
	ext_opts = {
		[require('luasnip.util.types').choiceNode] = {
			acitve = {
				virt_text = { { '*', 'GruveboxOrange' } },
			},
		},
	},

})

vim.keymap.set( { 'i', 's'} , '<C-p>', function()
	if ls.expand_or_jumpable() then
		ls.expand()
	end
end)


vim.keymap.set( { 'i', 's'} , '<C-k>', function()
	if ls.jumpable(1) then
		ls.jump(1)
	end
end)

vim.keymap.set( { 'i', 's'} , '<C-j>', function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end)

vim.keymap.set('n', '<leader><leader>s', '<cmd>source ~/.config/nvim/after/plugin/luasnips.lua<CR>', {})
