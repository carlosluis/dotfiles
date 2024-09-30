-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  require 'carlosluis/plugins/gitsigns',

  require 'carlosluis/plugins/which-key',

  require 'carlosluis/plugins/telescope',

  require 'carlosluis/plugins/lspconfig',

  require 'carlosluis/plugins/conform',

  require 'carlosluis/plugins/cmp',

  require 'carlosluis/plugins/colortheme',

  require 'carlosluis/plugins/todo-comments',

  require 'carlosluis/plugins/mini',

  require 'carlosluis/plugins/treesitter',

  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  require 'carlosluis.plugins.autopairs',
  -- require 'kickstart.plugins.neo-tree',
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
