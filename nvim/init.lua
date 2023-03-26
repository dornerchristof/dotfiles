--NeoVim config

--Activates line number
vim.opt.number = true

--Ignore uppercase letter when searching
vim.opt.ignorecase = true

--Highlights the result of the last search (anoying)
vim.opt.hlsearch = true

--Wraps long lines
vim.opt.wrap = true

--Preserves intentation of wraped (virtual) lines
vim.opt.breakindent = true

--Amount of spaces equal tab
vim.opt.tabstop = 8

--Amount of spaces neovim will intdent with << >> automaticly
vim.opt.shiftwidth = 8

--Expand tabs to spaces
vim.opt.expandtab = true


--Keybindings


--Lazy Nvim
local lazy = {}

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print('Installing lazy.nvim....')
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      path,
    })
  end
end

function lazy.setup(plugins)
  -- You can "comment out" the line below after lazy.nvim is installed
  lazy.install(lazy.path)

  vim.opt.rtp:prepend(lazy.path)
  require('lazy').setup(plugins, lazy.opts)
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

lazy.setup({
        {'folke/tokyonight.nvim'},
})


--Tokyonight
vim.opt.termguicolors = true;
vim.cmd.colorscheme('tokyonight')
