return {
  "AstroNvim/astrocommunity",
  -- Python
  { import = "astrocommunity.pack.python" },

  -- Prisma
  { import = "astrocommunity.pack.prisma" },

  -- Lua
  { import = "astrocommunity.pack.lua" },

  -- Docker
  { import = "astrocommunity.pack.docker" },

  -- Web
  { import = "astrocommunity.pack.astro" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.tailwindcss" },

  -- Serialized
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.toml" },

  -- Typescript
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.lsp.ts-error-translator-nvim" },

  -- Markdown
  { import = "astrocommunity.markdown-and-latex.render-markdown-nvim" },

  -- Utilities
  { import = "astrocommunity.utility.hover-nvim" },
  { import = "astrocommunity.lsp.actions-preview-nvim" },
  { import = "astrocommunity.quickfix.quicker-nvim" },
  { import = "astrocommunity.note-taking.global-note-nvim" },
  { import = "astrocommunity.search.grug-far-nvim" },
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  { import = "astrocommunity.editing-support.ultimate-autopair-nvim" },
  { import = "astrocommunity.editing-support.vim-doge" },
  { import = "astrocommunity.motion.mini-surround" },

  -- Upgrades
  { import = "astrocommunity.recipes.heirline-mode-text-statusline" },
  { import = "astrocommunity.icon.mini-icons" },
  { import = "astrocommunity.indent.snacks-indent-hlchunk" },
}
