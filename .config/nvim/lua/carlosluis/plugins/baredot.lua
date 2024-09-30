-- NOTE: This is to work with bare repo in dotfiles
return {
  {
    'ejrichards/baredot.nvim',
    opts = {
      git_dir = '$HOME/dotfiles', -- Change this path
      git_work_tree = '$HOME', -- Change this path
    },
  },
}
