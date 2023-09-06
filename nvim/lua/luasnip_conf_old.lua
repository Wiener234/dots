-- [[ luasnip ]]

local ls = require('luasnip')

require('luasnip.loaders.from_lua').load( { paths = '~/.config/nvim/snippets/' } )

ls.config.set_config({
	history = true,
	updateevents = 'TextChanged,TextChangedI',
	delete_check_events = 'TextChanged',
	enable_autosnippets = true,
	ext_opts = {
		[require('luasnip.util.types').choiceNode] = {
			active = {
				virt_text = { { "●", 'GruvboxOrange' } },
			},
		},
	},

})

vim.keymap.set( { 'i', 's'} , '<A-p>', function()
	if ls.expand_or_jumpable() then
		ls.expand()
	end
end)


vim.keymap.set( { 'i', 's'} , '<A-k>', function()
	if ls.jumpable(1) then
		ls.jump(1)
	end
end)

vim.keymap.set( { 'i', 's'} , '<A-j>', function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end)

vim.keymap.set( {'i', 's'} , '<A-m>', function()
	if ls.choice_active() then
		ls.change_choice(-1)
	end
end)

vim.keymap.set('n', '<leader><leader>s', '<cmd>source ~/.config/nvim/lua/luasnip_conf.lua<CR>', {})
