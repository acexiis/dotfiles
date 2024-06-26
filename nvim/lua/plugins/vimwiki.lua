-- Basic Vimwiki setup
vim.g.vimwiki_list = {
  {
    path = '~/vimwiki/',
    syntax = 'markdown',
    ext = '.md'
  }
}

-- Keybindings for Vimwiki
vim.api.nvim_set_keymap('n', '<Leader>ww', '<Plug>VimwikiIndex', {})
vim.api.nvim_set_keymap('n', '<Leader>wt', '<Plug>VimwikiTabIndex', {})
vim.api.nvim_set_keymap('n', '<Leader>ws', '<Plug>VimwikiUISelect', {})

