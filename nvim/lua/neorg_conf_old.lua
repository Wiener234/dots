-- [[neorg_conf.lua]]

require('neorg').setup{
	load = {
		["core.defaults"] = {},		-- Loads default behaviour
        ["core.concealer"] = {},	-- Adds pretty icons to your documents
        ["core.dirman"] = {			-- Manages Neorg workspaces
			config = {
				workspaces = {
					notes = "~/notes",
					nvim_conf = "~/nvim_conf_doc"
				},
				default_workspace = "notes",
            },
        },
    },
}
