-- main init.lua for nvim-config-lrdev

-- Bootstrap packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 
      'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('lrdev.plugins')

if packer_bootstrap then
  require('packer').sync()
end

require('lrdev.colorscheme')
require('lrdev.lsp')
require('lrdev.treesitter')
require('lrdev.telescope')
require('lrdev.dap')
require('lrdev.keymaps')
