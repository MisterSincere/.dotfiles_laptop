-- options.lua
local setup = function()
  -- disable annoying ring bell on "error"
  vim.opt.errorbells = false
  
  -- used string encoding
  vim.opt.encoding = 'utf-8'
  
  -- amount of spaces tab acts like it "skips"
  vim.opt.softtabstop = 2
  
  -- number of spaces to use for each step of (auto)indent
  vim.opt.shiftwidth = 2
  
  -- auto indent yes or no?
  vim.opt.autoindent = true
  
  -- determines when a window will have a status line (2=always)
  vim.opt.laststatus = 2
  
  -- show currently matching search results while typing
  vim.opt.incsearch = true
  
  -- highlight all matches of previous search pattern
  vim.opt.hlsearch = true
  
  -- would make a backup before overwriting a file
  vim.opt.backup = false
  
  -- if true vim will wrap long lines at character set by breakat
  vim.opt.linebreak = true
  
  -- save undo history to a file
  vim.opt.undofile = true
  
  -- file containing undo history if undofile is true
  vim.opt.undodir = '~/.config/nvim/undodir'
  
  -- enable 24-bit rgb colors
  vim.opt.termguicolors = true
  
  -- number of spaces tab expands to if expandtab is true
  vim.opt.tabstop = 2
  
  -- don't show evil swapfiles
  vim.opt.swapfile = false
  
  -- add horizontal splits below the current window 
  vim.opt.splitbelow = true
  
  -- add vertical splits to the right of current window
  vim.opt.splitright = true
  
  -- show at least this many lines before and after the current line
  vim.opt.scrolloff = 3
  
  -- show line numbers
  vim.opt.number = true
  
  -- ignore upper or lower casing in search results
  vim.opt.ignorecase = true
  
  -- stop ignoring casing if search query has different casing
  vim.opt.smartcase = true
  
  -- automatically expand tabs to spaces
  vim.opt.expandtab = true
  
  -- display a vertical column at 80 characters
  --vim.opt.colorcolumn = '80'
  
  -- still done via vim.cmd 'cause I can't get this to work via lua
  --vim.opt.statusline = '%!FugitiveStatusline() %f%m%=%l/%L %y'
  
  -- keep a buffer in memory if it gets temporarily abandoned
  vim.opt.hidden = true
  
  -- mouse support in normal and visual mode
  vim.opt.mouse = 'nv' 
  
  -- yank, delete, change etc. to and from the system clipboard
  vim.opt.clipboard = 'unnamedplus'
end

return {
  setup = setup
}
