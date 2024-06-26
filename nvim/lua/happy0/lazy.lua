local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { 'nvim-telescope/telescope.nvim',    tag = '0.1.7',       dependencies = { 'nvim-lua/plenary.nvim' } },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "scala", "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "typescript", "markdown" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
  { "catppuccin/nvim",                  name = "catppuccin", priority = 1000 },
  { "ThePrimeagen/harpoon" },
  { "mbbill/undotree" },
  { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
  -- LSP stuff
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/nvim-cmp' },
  { 'L3MON4D3/LuaSnip' },
  { 'nvim-tree/nvim-tree.lua',          version = "*",       lazy = false,                              dependencies = { "nvim-tree/nvim-web-devicons" } },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },
  {
    'folke/flash.nvim',
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash treesitter" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,     desc = "Toggle Flash Search" },
    }
  }
})
