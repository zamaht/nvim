return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function ()
    local telescope = require("telescope.builtin")
    vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = 'Find files with Telescope' })
    vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = 'Live grep with Telescope' })
    vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = 'Find in buffers with Telescope' })
    vim.keymap.set('n', '<leader>fh', telescope.help_tags, { desc = 'Show help tags' })
  end
}
