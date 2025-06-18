return {
  "f3fora/cmp-spell",
  init = function()
    vim.g.spellfile_URL = "https://ftp.nluug.nl/vim/runtime/spell"
    vim.opt.spell = true
    vim.opt.spelllang = { "en", "es" }
  end,
}
