return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,
  config = function()
    require("catppuccin").setup({
      integrations = {
        neotree = true,
        lazy = true,
        mason = true,
      }
    })
    vim.cmd.colorscheme "catppuccin"
  end
}

