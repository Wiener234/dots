local cmd = vim.api.nvim_command
local api = vim.api

package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
  package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"

vim.g.mapleader = " "
vim.g.maplocalleader = ","

cmd(":set nu")
cmd(":set rnu")

require('plug')
require('lsp')
require('plugconf')
require('gruvbox_conf')
require('opts')
require('keys')
require('luasnip_conf')
require('vimtex')
require('neorg_conf')
require('dap_conf')