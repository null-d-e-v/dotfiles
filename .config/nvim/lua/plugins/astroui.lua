return {
  {
    "sainnhe/gruvbox-material",
    lazy = true,
    dependencies = {
      "AstroNvim/astrocore",
      opts = {
        options = {
          g = {
            gruvbox_material_background = "hard",
            gruvbox_material_enable_italic = true,
            gruvbox_material_float_style = "dim",
            gruvbox_material_diagnostic_virtual_text = "colored",
            gruvbox_material_better_performance = true,
            gruvbox_material_cursor = "purple",
            gruvbox_material_inlay_hints_background = "dimmed",
          },
        },
      },
    },
  },
  {
    "AstroNvim/astroui",
    opts = {
      colorscheme = "gruvbox-material",
      highlights = {
        ["gruvbox-material"] = {
          Search = { fg = "#ea6962" },
        },
      },
      icons = {
        LSPLoading1 = "⠋",
        LSPLoading2 = "⠙",
        LSPLoading3 = "⠹",
        LSPLoading4 = "⠸",
        LSPLoading5 = "⠼",
        LSPLoading6 = "⠴",
        LSPLoading7 = "⠦",
        LSPLoading8 = "⠧",
        LSPLoading9 = "⠇",
        LSPLoading10 = "⠏",
      },
    },
  },
}
