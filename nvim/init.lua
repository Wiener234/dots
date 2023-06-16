--[[ init.lua ]]

local cmd = vim.api.nvim_command
local api = vim.api

-- LEADER
vim.g.mapleader = ","
vim.g.localleader = "\\"

-- Imports
require('plugins')
require('opts')
require('keys')
require('lsp')
require('snippets')
