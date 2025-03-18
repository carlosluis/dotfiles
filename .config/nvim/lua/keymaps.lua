-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<leader><CR>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Open up project view
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Open up init.lua
vim.keymap.set('n', '<leader>ev', '<cmd> :e $MYVIMRC<CR>')

-- Source init.lua
vim.keymap.set('n', '<leader>sv', '<cmd> :so $MYVIMRC<CR>')

-- Use jj to escape insert mode back to normal mode
vim.keymap.set('i', 'jj', '<Esc>')

-- Visual moving of highlighted section
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Keep cursor in the middle when doing half jumps
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Keep cursor in the middle when doing searches
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Use leader p to paste while preserving the buffer
vim.keymap.set('x', '<leader>p', '"_dP')

-- Vertical split current pane
vim.keymap.set('n', '<leader>v', '<cmd> :vsplit<CR>')

-- Exit terminal mode with Esc
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Set language specific column guides
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  callback = function()
    vim.opt.colorcolumn = '120'
  end,
})

-- Supress confirmation messages from vim fugitive
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'gitcommit',
  callback = function()
    vim.opt_local.cmdheight = 2
  end,
})

vim.api.nvim_create_user_command('FixCmdHeight', function()
  vim.o.cmdheight = 1
end, {})
vim.keymap.set('n', '<leader>fh', ':FixCmdHeight<CR>', { noremap = true, silent = true })

vim.api.nvim_create_user_command('Git', function(opts)
  vim.cmd('silent! Git ' .. opts.args)
end, { nargs = '*' })
