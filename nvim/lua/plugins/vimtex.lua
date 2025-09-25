return {
  "lervag/vimtex",
  lazy = false, -- lazy-loading will disable inverse search
    ft = {"tex", "latex", "markdown"},
  config = function()
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_compiler_latexmk = "latexmk"
  end,
  keys = {
    { "<localLeader>l", "", desc = "+vimtex" },
  },
}

