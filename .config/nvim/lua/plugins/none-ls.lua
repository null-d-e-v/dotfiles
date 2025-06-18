return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    { "AstroNvim/astrolsp", opts = {} },
  },
  opts = function() return { on_attach = require("astrolsp").on_attach } end,
}
