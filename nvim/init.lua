--[[ init.lua ]]

local cmd = vim.api.nvim_command
local api = vim.api

-- LEADER
vim.g.mapleader = ","
vim.g.localleader = "\\"

cmd(':set nu')

-- Imports
require('plug')
require('opts')
require('keys')
require('lsp')
require('luasnip_conf')
