
local setup  = function()
  local Plug = vim.fn['plug#']
  vim.call('plug#begin', '~/.config/nvim/plugged')

  Plug 'morhetz/gruvbox'
  Plug 'tpope/vim-fugitive'
  Plug 'vim-utils/vim-man'
  Plug 'lyuts/vim-rtags'
  Plug 'zivyangll/git-blame.vim'
  Plug 'mbbill/undotree'
  
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'noib3/nvim-cokeline'
  
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-lua/plenary.nvim'
  
  Plug 'Yohannfra/Vim-Goto-Header'
  
  vim.call('plug#end')
end

return {
  setup = setup
}
