-- main init.lua for nvim-config-lrdev

-- Set the Leader key to comma
vim.g.mapleader = ","

-- Set Absolute numbers for editor
vim.opt.number = true

-- For Vantor Projects
vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
  pattern = { "*/Vantor/**/*.cpp", "*/Vantor/**/*.hpp" },
  callback = function(args)
    -- only insert if file is empty
    if vim.api.nvim_buf_line_count(0) == 1
      and vim.api.nvim_buf_get_lines(0, 0, 1, false)[1] == "" then

      local header = {
        "/****************************************************************************",
        " * Vantor Engine™ - Source Code (2025)",
        " *",
        " * Author    : Lukas Rennhofer (@LukasRennhofer), Vantor Studios™",
        " * Copyright : © 2025 Lukas Rennhofer, Vantor Studios™",
        " * License   : GNU General Public License v3.0",
        " *             See LICENSE file for full details.",
        " ****************************************************************************/",
        "",
      }

      -- insert header
      vim.api.nvim_buf_set_lines(0, 0, -1, false, header)

      -- check filetype by extension
      local fname = args.file
      if fname:match("%.hpp$") then
        vim.api.nvim_buf_set_lines(0, -1, -1, false, { "#pragma once", "" })
      end
    end
  end,
})


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
