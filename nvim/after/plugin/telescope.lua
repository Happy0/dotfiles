local builtin = require('telescope.builtin') 
local telescope = require('telescope')

telescope.setup({
  defaults = {
    --   path_display = { "tail" },
    layout_strategy = "vertical"
  }
})

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
vim.keymap.set('n', '<C-p>', builtin.git_files,{})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

