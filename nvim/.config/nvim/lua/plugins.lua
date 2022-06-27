
local setup  = function()
  local Plug = vim.fn['plug#']
  vim.call('plug#begin', '~/.config/nvim/plugged')

  Plug 'dunstontc/vim-vscode-theme'
  Plug 'morhetz/gruvbox'
  Plug 'khaveesh/vim-fish-syntax'

  Plug 'tpope/vim-fugitive'
  Plug 'vim-utils/vim-man'
  Plug 'lyuts/vim-rtags'
  Plug 'zivyangll/git-blame.vim'
  --Plug 'mbbill/undotree'
  
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'noib3/nvim-cokeline'
  
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-ui-select.nvim'

  Plug 'nvim-lua/plenary.nvim'

  Plug 'mfussenegger/nvim-dap'
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'theHamsta/nvim-dap-virtual-text'
  Plug 'Shatur/neovim-cmake'
  
  Plug 'Yohannfra/Vim-Goto-Header'
  
  vim.call('plug#end')
end

return {
  setup = setup
}
