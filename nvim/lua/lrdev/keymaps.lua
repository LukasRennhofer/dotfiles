local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>h', ':nohlsearch<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', opts)