-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- TODO: move this to options.lua file
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.relativenumber = true
vim.mouse = "nvi"

local plugins = {
  spec = {
    -- import your plugins
    { import = "plugins.colorscheme" },
    { import = "plugins.telescope" },
    { import = "plugins.treesitter" },
  },
}

-- Setup lazy.nvim
require("lazy").setup(
  plugins
)

require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

-- TODO: move this keymaps.lua
local telescope = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = 'Find files with Telescope' })
vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = 'Live grep with Telescope' })
vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = 'Find in buffers with Telescope' })
vim.keymap.set('n', '<leader>fh', telescope.help_tags, { desc = 'Show help tags' })

-- TODO: move this to treesitter config?
local ts_config = require("nvim-treesitter.configs")
ts_config.setup({
  ensure_installed = {"lua", "typescript", "rust", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
  highlight = { enable = true },
  indent = { enable = true },
})

