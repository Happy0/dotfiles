local builtin = require('telescope.builtin') 
local telescope = require('telescope')

telescope.setup({
  defaults = {
    pickers = {lsp_references = { show_line = false }}
  }
})

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fr', function () builtin.lsp_references({show_line = false}) end, {})
vim.keymap.set('n', '<C-p>', builtin.git_files,{})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

