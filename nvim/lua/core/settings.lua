-- Configure Settings
vim.opt.termguicolors = true
vim.opt.number = true 
vim.opt.relativenumber = true
vim.opt.mouse = "a" 
vim.opt.breakindent = true
vim.opt.undofile = true 
vim.opt.ignorecase = true
vim.opt.smartcase = true 
vim.opt.updatetime = 250 
vim.opt.signcolumn = "yes"
vim.opt.clipboard = "unnamedplus"
vim.bo.shiftwidth = 4
vim.opt.splitright = true
vim.bo.tabstop = 4
vim.bo.expandtab = true

vim.opt.smartindent=true
vim.opt.autoindent=true
vim.opt.smarttab=true
vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.expandtab=true
vim.opt.shiftwidth=4


-- vim.cmd('highlight ExtraWhitespace ctermbg=red guibg=red')
-- vim.cmd('match ExtraWhitespace /\\s\\+$/')

--automatically load and safe view file
vim.api.nvim_create_autocmd("BufWinLeave", {pattern = "*.*", command = "mkview"})
vim.api.nvim_create_autocmd("BufWinEnter", {pattern = "*.*", command = "silent! loadview"})

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

vim.cmd("colorscheme tokyonight")
