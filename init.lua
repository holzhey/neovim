vim.g.mapleader = " "
vim.g.localleader = "#"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

local plugins = require("plugins")
local opts = {}

require("lazy").setup(plugins, opts)

-- Keymaps, move later

local builtin = require('telescope.builtin')
local trouble = require('trouble')

local wk = require("which-key")
wk.register({
  f = {
    name = "Files",
    f = { builtin.find_files, "Find Files" },
    r = { builtin.oldfiles, "Recent Files"},
    g = { builtin.live_grep, "Live Grep"},
    b = { builtin.buffers, "Buffers"},
  },
  c = {
    name = "Code",
    r = { builtin.lsp_references, "References" },
    i = { builtin.lsp_implementations, "Implementations" },
    d = { builtin.lsp_definitions, "Definitions" },
    D = { builtin.lsp_type_definitions, "Type Definitions" },
    t = { trouble.toggle, "Troubles" },
    c = {
      name = "Calls",
      i = { builtin.lsp_incoming_calls, "Incoming" },
      o = { builtin.lsp_outcoming_calls, "Outcoming" },
    },
    s = {
      name = "Symbols",
      d = { builtin.lsp_document_symbols, "Document" },
      w = { builtin.lsp_workplace_symbols, "Workplace" },
    },
  },
  g = {
    name = "Git",
    c = { builtin.git_commits, "Commits" },
    b = { builtin.git_branches, "Branches" },
    s = { builtin.git_status, "Status" },
  },
}, { prefix = "<leader>" })


-- Config, move later

vim.wo.relativenumber = true
vim.cmd.colorscheme "catppuccin"

