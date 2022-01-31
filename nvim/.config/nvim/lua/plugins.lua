local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'zivyangll/git-blame.vim'
--Plug 'ycm-core/YouCompleteMe'
Plug 'mbbill/undotree'
Plug 'kyazdani42/nvim-web-devicons'
vim.call('plug#end')
