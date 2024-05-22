local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions

  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)

  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.format({ bufnr = bufnr }) end
    })
  end
end)

require("mason").setup()
require("mason-lspconfig").setup(
  {
    ensure_installed = { "lua_ls", "tsserver" },
    handlers = {
      function(server_name)
        require('lspconfig')[server_name].setup({})
      end,
    },
  })

local cmp = require("cmp")

cmp.setup({
  sources = { { name = 'nvim_lsp' } },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
  })

})
