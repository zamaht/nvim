return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'main',
  lazy = false, 
  build = ":TSUpdate",
  config = function() 
    local ts_config = require("nvim-treesitter.configs")
    ts_config.setup({
      ensure_installed = {"lua", "typescript", "rust", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
