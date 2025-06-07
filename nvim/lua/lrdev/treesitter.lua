require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "lua", "python", "glsl" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
  },
}