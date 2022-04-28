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

local setup = function()
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
  
  -- telescope / reloading
  nmap('<F1>', '<cmd>:lua require("utils.reload").reload()<CR>', {silent=true,noremap=false})

  -- telescope / project view
  nmap('<leader>v', '<cmd>:lua require("utils.project_view").view()<CR>', {silent=true})
  
  -- cokeline
  nmap('<Tab>',     '<Plug>(cokeline-focus-next)', {silent = true, noremap = false})
  nmap('<S-Tab>',   '<Plug>(cokeline-focus-prev)', {silent = true, noremap = false})
  nmap('<leader>c', '<Plug>(cokeline-pick-close)', {silent = true, noremap = false})
  
  -- gotoheader
  nmap('<F12>', ':GotoHeader<CR>')
  imap('<F12>', '<ESC>:GotoHeader<CR>')
  nmap('<leader>gh', ':GotoHeaderSwitch<CR>')

  -- cmake building
  nmap('<C-t>', ':CMake select_target<CR>')
  nmap('<C-d>', ':CMake select_build_type<CR>')
  nmap('<C-c>', ':CMake configure<CR>')
  nmap('<C-b>', ':CMake build<CR>')
  nmap('<leader><F5>', ':CMake build_and_debug<CR>')
  nmap('<F5>', ':CMake run')

  -- dap
  nmap('<F9>', ':lua require\'dap\'.toggle_breakpoint()<CR>')
  nmap('<leader><F9>', ':lua require\'dap\'.set_breakpoint(vim.fn.input(\'Breakpoint condition: \'))<CR>')
  nmap('<F6>', ':lua require\'dap\'.step_into()<CR>')
  nmap('<F7>', ':lua require\'dap\'.step_over()<CR>')
  nmap('<F8>', ':lua require\'dap\'.continue()<CR>')


end

return {
  setup = setup
}
