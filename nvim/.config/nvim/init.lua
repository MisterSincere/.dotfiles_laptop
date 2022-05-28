-- init.lua

local plugins       = require('plugins')
local plugin_config = require('plugin-config')
local coloring      = require('coloring')
local options       = require('options')
local keybindings   = require('keybindings')

plugins.setup()
plugin_config.setup()
coloring.setup()
options.setup()
keybindings.setup()

vim.cmd('source ~/.config/nvim/vim/statusline.vim')
vim.cmd('source ~/.config/nvim/vim/autocommands.vim')
