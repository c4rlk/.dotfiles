require("core.packer")
require("core.remap")
require("core.settings")
require("core.plugin_config")

-- Make Packer autocompile when plugin.lua is updated
--
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerCompile
--   augroup end
-- ]])


