local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local buf_set_keymap = function(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<leader>f', '<Cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

nvim_lsp.clangd.setup{
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}
