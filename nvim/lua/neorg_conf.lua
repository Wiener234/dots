require('neorg').setup{

    load = {
		["core.defaults"] = {},
		["core.concealer"] = {},
		["core.export"] = {},
		["core.ui"] = {},
		["core.ui.calendar"] = {},

  ["core.export.markdown"] = {
			config = {
				extensions = "all",
			},
		},

        ["core.dirman"] = {
			config = {
				workspaces = {
					notes = "~/Nextcloud/Notizen/notes",
					nvim_conf = "~/nvim_conf_doc"
				},
				default_workspace = "notes",
			},
		},

["core.journal"] = {
	config = {
		template_name = "journal_template.norg",
	},
},

 },
}