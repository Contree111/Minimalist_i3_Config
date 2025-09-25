vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "
vim.g.maplocalleader = ','
vim.wo.relativenumber = true

vim.g.loaded_autopairs = 1
--[[
vim.g.tex_flavor = "latex"
vim.g.vimtex_view_method = "zathura" -- or "skim" on macOS
vim.g.vimtex_compiler_method = "latexmk"

vim.g.vimtex_compiler_latexmk = {
  build_dir = "build",
  options = {
    "-pdf",
    "-interaction=nonstopmode",
    "-synctex=1",
  },
}

vim.g.vimtex_mappings_enabled = 1
vim.g.vimtex_fold_enabled = 1
vim.g.vimtex_syntax_enabled = 1
vim.g.vimtex_quickfix_mode = 0
vim.g.vimtex_view_forward_search_on_start = 1
]]-- 



-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)


vim.g.vimtex_compiler_latexmk = {
  build_dir = "",
  callback = 1,
  continuous = 1,
  executable = "latexmk",
  options = {
        "-aux-directory=.latexbuild",
    "-pdf",
    "-shell-escape",
    "-verbose",
    "-file-line-error",
    "-interaction=nonstopmode",
  }
}

vim.cmd.colorscheme("candle-grey-transparent")
