local ls = require("luasnip") --{{{
local s = ls.s
local i = ls.i
local t = ls.t

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {} --}}}

local group = vim.api.nvim_create_augroup("Lua Snippets", { clear = true })
local file_pattern = "*.lua"

local function cs(trigger, nodes, opts) --{{{
	local snippet = s(trigger, nodes)
	local target_table = snippets

	local pattern = file_pattern
	local keymaps = {}

	if opts ~= nil then
		-- check for custom pattern
		if opts.pattern then
			pattern = opts.pattern
		end

		-- if opts is a string
		if type(opts) == "string" then
			if opts == "auto" then
				target_table = autosnippets
			else
				table.insert(keymaps, { "i", opts })
			end
		end

		-- if opts is a table
		if opts ~= nil and type(opts) == "table" then
			for _, keymap in ipairs(opts) do
				if type(keymap) == "string" then
					table.insert(keymaps, { "i", keymap })
				else
					table.insert(keymaps, keymap)
				end
			end
		end

		-- set autocmd for each keymap
		if opts ~= "auto" then
			for _, keymap in ipairs(keymaps) do
				vim.api.nvim_create_autocmd("BufEnter", {
					pattern = pattern,
					group = group,
					callback = function()
						vim.keymap.set(keymap[1], keymap[2], function()
							ls.snip_expand(snippet)
						end, { noremap = true, silent = true, buffer = true })
					end,
				})
			end
		end
	end

	table.insert(target_table, snippet) -- insert snippet into appropriate table
end --}}}

-- Start Refactoring --

local sout = s('sout',
	fmt(
	[[
System.out.println({});
	]],
	{
		i(1, 'output'),
	}
	)
)
table.insert(snippets, sout)

local simpl_main_boiler = s('simpl_main_boiler', 
	fmt(
	[[
public class {} {{

	public static void main(String[] args){{
		{}
	}}

}}
	]],
	{
		f(function(args, snip)
			local name = vim.split(snip.env.TM_FILENAME, '.', true)
			return name[1] or ''
		end, {}),
		i(1, '// TODO: write function'),
	}
	)
)
table.insert(snippets, simpl_main_boiler)

local main_boiler = s('main_boiler', 
	fmt(
	[[
package {};

public class {} {{

	public static void main(String[] args){{
		{}
	}}

}}
	]],
	{
		i(1,'de.wiener234'),
		f(function(args, snip)
			local name = vim.split(snip.env.TM_FILENAME, '.', true)
			return name[1] or ''
		end, {}),
		i(2, '// TODO: write function'),
	}
	)
)
table.insert(snippets, main_boiler)

local simple_boiler = s('simple_boiler',
	fmt(
	[[
public class {} {{
	{}
}}
	]],
	{
		f(function (args, snip)
			local name = vim.split(snip.env.TM_FILENAME, '.', true)
			return name[1] or ''
		end, {}),
		i(1, '// TODE: write class'),
	}
	)
)
table.insert(snippets, simple_boiler)

local boiler = s('boiler',
	fmt(
	[[
package {};

public class {} {{
	{}
}}
	]],
	{
		i(1, 'de.wiener234'),
		f(function (args, snip)
			local name = vim.split(snip.env.TM_FILENAME, '.', true)
			return name[1] or ''
		end, {}),
		i(2, '// TODE: write class'),
	}
	)
)
table.insert(snippets, boiler)

local For = s('for',
	fmt(
	[[
for( {}, {}, {}){{
	{}
}}
	]],
	{
		i(1, 'initVar'),
		i(2, 'condition'),
		i(3, 'range'),
		i(4, '// TODO: write for loop'),
	}
	)
)
table.insert(snippets, For)
-- End Refactoring --

return snippets, autosnippets
