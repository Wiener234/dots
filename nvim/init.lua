--[[ init.lua ]]


local cmd = vim.api.nvim_command
local api = vim.api

-- LEADER
vim.g.mapleader = "\\"
vim.g.maplocalleader = ","

cmd(':set nu')
cmd(':set rnu')

-- Imports
require('plug')
require('plugconf')
require('gruvbox_conf')
require('opts')
require('lsp')
require('luasnip_conf')
require('vimtex')
require('neorg_conf')
require('keys')
