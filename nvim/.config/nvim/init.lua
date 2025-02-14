-- Set wiki root directory
vim.g.wiki_root = '~/notes/'

-- Leader key
vim.g.mapleader = ' '

-- General settings
vim.o.number = true
vim.cmd('colorscheme cyberdream')
vim.o.ignorecase = true  -- Case-insensitive search
vim.o.shiftwidth = 4

-- Load Lua modules
require('lsp')

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end



vim.cmd('packadd telescope.nvim')
local telescope = require('telescope')
--
telescope.setup({
  pickers = {
    find_files = {
      push_tagstack_on_edit = true,
    },
    live_grep = {
      push_tagstack_on_edit = true,
    },
  },
})


-- Key mappings for Telescope
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true, silent = true })


local diagnostics = {
  virtual_text = false, -- Disable builtin virtual text diagnostic
  virtual_improved = {
    current_line = 'only',
  },
}
vim.diagnostic.config(diagnostics)


vim.api.nvim_create_user_command('LspHover', function()
    vim.lsp.buf.hover()
end, {})


vim.api.nvim_set_hl(0, "MiniCursorword", {
	underline=false,
	bold = true,
	fg = "#ff0000",
})
require('mini.cursorword').setup()

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = false
  }
)



