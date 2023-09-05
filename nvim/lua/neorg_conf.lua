require('neorg').setup{

    load = {
		["core.defaults"] = {},
		["core.concealer"] = {},
		["core.export"] = {},
		["core.export.markdown"] = {
			config = {
				extensions = "all",
			},
		},

        ["core.dirman"] = {
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