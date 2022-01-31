local function map(mode, combo, mapping, opts)
  local options = {noremap = true}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, combo, mapping, options)
end

local function imap(combo, mapping, opts)
  map('i', combo, mapping, opts)
end

local function nmap(combo, mapping, opts)
  map('n', combo, mapping, opts)
end

-- key to enter command mode
vim.g.mapleader = " "
vim.g.maplocalleader = " "

imap('jj', '<ESC>')

nmap('<F12', ':e ~/.config/nvim/init.lua<CR>')
--nmap <F5> :source ~/.vim/vimrc<CR>

nmap('<leader>gh', ':diffget //3<CR>')
nmap('<leader>gu', ':diffget //2<CR>')
nmap('<leader>gs', ':G<CR>')

-- keypress do disable search result highlighting
nmap('<leader>n', ':nohlsearch<CR>')

-- win commands with leader
nmap('<leader>h', ':wincmd h<CR>')
nmap('<leader>j', ':wincmd j<CR>')
nmap('<leader>k', ':wincmd k<CR>')
nmap('<leader>l', ':wincmd l<CR>')

-- redo command
nmap('<leader>r', ':redo<CR>')

-- save and close commands with leader
nmap('<leader>s', ':w<CR>')
nmap('<leader>q', ':q<CR>')

nmap('<leader>u', ':UndotreeShow<CR>')
nmap('<leader>ps', ':Rg<space>')

-- resizing with leader
nmap('<leader>+', ':vertical resize +5<CR>', {silent=true})
nmap('<leader>-', ':vertical resize -5<CR>', {silent=true})

-- ycm plugin keybinds
nmap('<leader>gd', ':YcmCompleter GoTo<CR>', {silent=true})
nmap('<leader>gf', ':YcmCompleter FixIt<CR>', {silent=true})

-- git blame plugin
nmap('<leader>b', ':<C-u>call gitblame#echo()<CR>')

