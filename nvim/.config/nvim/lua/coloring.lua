-- coloring.lua

local setup = function()
  vim.opt.background = 'dark'
  vim.cmd('colorscheme gruvbox')
  vim.cmd('syntax on')
  vim.cmd('hi! Normal guibg=NONE gui=NONE ctermbg=NONE cterm=NONE')
end

return {
  setup = setup
}
