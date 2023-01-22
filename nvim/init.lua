--[[ init.lua ]]

local cmd = vim.api.nvim_command

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = ","
vim.g.localleader = "\\"

-- IMPORTS
require('vars')      -- Variables
require('opts')      -- Options
require('keys')      -- Keymaps
require('plug')      -- Plugins

-- PLUGINS: Add this section
require'colorizer'.setup{
DEFAULT_OPTIONS = {
	RGB      = true;         -- #RGB hex codes
	RRGGBB   = true;         -- #RRGGBB hex codes
	names    = true;         -- "Name" codes like Blue
	RRGGBBAA = true;        -- #RRGGBBAA hex codes
	rgb_fn   = true;        -- CSS rgb() and rgba() functions
	hsl_fn   = true;        -- CSS hsl() and hsla() functions
	css      = true;        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
	css_fn   = true;        -- Enable all CSS *functions*: rgb_fn, hsl_fn
	-- Available modes: foreground, background
	mode     = 'background'; -- Set the display mode.
  }
}

require('plugins.config.vimtex')

vim.opt.termguicolors = true

require('todotxt-nvim').setup({

  todo_file = "/home/nils/Nextcloud/Notizen/ToDo.todo.txt",
  sidebar = {
    width = 40,
    position = "right", -- default: "right"
  },
  capture = {
    prompt = "> ",
    -- percentage is percentage of width of the whole editor
    -- integer is number of columns
    width = "75%",
    position = "50%",
    -- styled after https://swiftodoapp.com/todotxt-syntax/priority/
    -- with this, if you include any of the below keywords it will
    -- automatically use the associated priority and remove that
    -- keyword from the final task.
    alternative_priority = {
      a = "now",
      b = "next",
      c = "today",
      d = "this week",
      e = "next week",
    },
  },
  -- highlights used in both capture prompt and tasks sidebar
  -- each highlight type can be a table with 'fg', 'bg' and 'style'
  -- options or a string referencing an existing highlight group.
  -- highlights = {
  --   project = "identifier",
  -- }
  highlights = {
    project = {
      fg = "magenta",
      bg = "none",
      style = "none",
    },
    context = {
      fg = "cyan",
      bg = "none",
      style = "none",
    },
    date = {
      fg = "none",
      bg = "none",
      style = "underline",
    },
    done_task = {
      fg = "gray",
      bg = "none",
      style = "none",
    },
    priorities = {
      a = {
        fg = "red",
        bg = "none",
        style = "bold",
      },
      b = {
        fg = "magenta",
        bg = "none",
        style = "bold",
      },
      c = {
        fg = "yellow",
        bg = "none",
        style = "bold",
      },
      d = {
        fg = "cyan",
        bg = "none",
        style = "bold",
      },
    },
  },
  -- keymap used in sidebar split
  keymap = {
    quit = "q",
    toggle_metadata = "m",
    delete_task = "dd",
    complete_task = "<space>",
    edit_task = "ee",
  },

})

-- empty setup using defaults: add your own options
--require'nvim-tree'.setup {
--}

-- or

-- setup with all defaults
-- each of these are documented in `:help nvim-tree.option_name`
-- nested options are documented by accessing them with `.` (eg: `:help nvim-tree.view.mappings.list`).
require'nvim-tree'.setup { -- begin_default_opts
  auto_reload_on_write = true,
  disable_netrw = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = false,
  open_on_setup = true,
  open_on_setup_file = true,
  open_on_tab = false,
  sort_by = "name",
  update_cwd = false,
  view = {
    width = 30,
    --height = 30,
    hide_root_folder = false,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      custom_only = false,
      list = {
        -- user mappings go here
      },
    },
  },
  renderer = {
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
    }
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = false,
    update_cwd = false,
    ignore_list = {},
  },
  ignore_ft_on_setup = {},
  system_open = {
    cmd = "",
    args = {},
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "abcdefghijklmnopqrstuvwxyz1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      diagnostics = false,
      git = false,
      profile = false,
    },
  },
} -- end_default_opts

-- the setup config table shows all available config options with their default values:
require("presence"):setup({
    -- general options
    auto_update         = true,                       -- update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
    neovim_image_text   = "the one true text editor", -- text displayed when hovered over the neovim image
    main_image          = "neovim",                   -- main image display (either "neovim" or "file")
    client_id           = "793271441293967371",       -- use your own discord application client id (not recommended)
    log_level           = nil,                        -- log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    debounce_timeout    = 10,                         -- number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    enable_line_number  = false,                      -- displays the current line number instead of the current project
    blacklist           = {},                         -- a list of strings or lua patterns that disable rich presence if the current file name, path, or workspace matches
    buttons             = true,                       -- configure rich presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
    file_assets         = {},                         -- custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)

    -- rich presence text options
    editing_text        = "editing %s",               -- format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    file_explorer_text  = "browsing %s",              -- format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    git_commit_text     = "committing changes",       -- format string rendered when committing changes in git (either string or function(filename: string): string)
    plugin_manager_text = "managing plugins",         -- format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    reading_text        = "reading %s",               -- format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    workspace_text      = "working on %s",            -- format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    line_number_text    = "line %s out of %s",        -- format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
})

require("mason").setup()

--Python
require'lspconfig'.jedi_language_server.setup{}

--Rust

local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

-- LSP Diagnostics Options Setup 
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = ''})
sign({name = 'DiagnosticSignWarn', text = ''})
sign({name = 'DiagnosticSignHint', text = ''})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

-- Completion Plugin Setup
local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },
  -- Installed sources:
  sources = {
    { name = 'path' },                              -- file paths
    { name = 'nvim_lsp', keyword_length = 3 },      -- from language server
    { name = 'nvim_lsp_signature_help'},            -- display function signatures with current parameter emphasized
    { name = 'nvim_lua', keyword_length = 2},       -- complete neovim's Lua runtime API such vim.lsp.*
    { name = 'buffer', keyword_length = 2 },        -- source current buffer
    { name = 'vsnip', keyword_length = 2 },         -- nvim-cmp source for vim-vsnip 
    { name = 'calc'},                               -- source for math calculation
  },
  window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
  },
  formatting = {
      fields = {'menu', 'abbr', 'kind'},
      format = function(entry, item)
          local menu_icon ={
              nvim_lsp = 'λ',
              vsnip = '⋗',
              buffer = 'Ω',
              path = '',
          }
          item.menu = menu_icon[entry.source.name]
          return item
      end,
  },
})

-- Treesitter Plugin Setup 
require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "rust", "toml" },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting=false,
  },
  ident = { enable = true }, 
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}


