
local setup  = function()
	local Plug = vim.fn['plug#']
  	vim.call('plug#begin', '~/.config/nvim/plugged')

	-- theming
  	Plug 'khaveesh/vim-fish-syntax'
  	Plug 'tikhomirov/vim-glsl'

	-- cpp highlighting
	Plug 'bfrg/vim-cpp-modern'

	-- automatic tag generation
	Plug 'ludovicchabant/vim-gutentags'

	-- used in status line to display git status
  	Plug 'tpope/vim-fugitive'
	
	-- a bufferline and its icons
  	Plug 'kyazdani42/nvim-web-devicons'
  	Plug 'noib3/nvim-cokeline'
  	
	-- nvim dialog tool
  	Plug 'nvim-telescope/telescope.nvim'
  	Plug 'nvim-telescope/telescope-ui-select.nvim'

	-- used for reloading configs
  	Plug 'nvim-lua/plenary.nvim'

	-- cpp used plugins
  	Plug 'mfussenegger/nvim-dap'
  	Plug 'nvim-treesitter/nvim-treesitter'
  	Plug 'theHamsta/nvim-dap-virtual-text'
  	Plug 'Shatur/neovim-cmake'
  	Plug 'Yohannfra/Vim-Goto-Header'

	-- format cpp file according to .clang-format via <leader>f
	Plug 'rhysd/vim-clang-format'

	-- keybinding <leader>u
	Plug 'mbbill/undotree'

	--Plug 'lyuts/vim-rtags'
  	--Plug 'vim-utils/vim-man'
  	
  	vim.call('plug#end')
end

return {
  setup = setup
}
