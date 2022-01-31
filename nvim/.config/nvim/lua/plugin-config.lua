-- allow rg to detect root of git
local executable = vim.fn['executable']
if executable('rg') then
  vim.g.rg_derive_root = 'true'
end

-- thing to ignore in search
vim.g.ctrlp_user_command = {'.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'}
vim.g.ctrlp_use_caching = 0

-- ycm options
vim.g.ycm_enable_diagnostic_highlighting = 0
vim.g.ycm_enable_diagnostic_signs = 0
vim.g.ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'
