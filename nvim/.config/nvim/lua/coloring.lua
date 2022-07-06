-- coloring.lua

local setup = function()
  vim.opt.background = 'dark'
  vim.cmd('colorscheme dark_plus')
  vim.cmd('syntax on')
  --vim.cmd('hi! Normal guibg=NONE gui=NONE ctermbg=NONE cterm=NONE')
  --vim.cmd('hi! SignColumn guibg=NONE gui=NONE ctermbg=NONE cterm=NONE')
end

return {
  setup = setup
}
