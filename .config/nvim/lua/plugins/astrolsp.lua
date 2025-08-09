return {
  "AstroNvim/astrolsp",
  ---@diagnostic disable: missing-fields
  ---@type AstroLSPOpts
  opts = {
    -- Configuration table of features provided by AstroLSP
    config = {
      vtsls = {
        settings = {
          vtsls = {
            experimental = {
              completion = {
                enableServerSideFuzzyMatch = true,
              },
            },
          },
          typescript = {
            tsserver = {
              maxTsServerMemory = 8192,
            },
            preferences = {
              importModuleSpecifier = "non-relative",
              preferTypeOnlyAutoImports = true,
            },
            format = {
              enable = false,
            },
          },
        },
      },
      tailwindcss = {
        settings = {
          tailwindCSS = {
            experimental = {
              classRegex = {
                { "\\b\\w*Style\\b\\s*=\\s*[\"'`]([^\"'`]*)[\"'`]" },
                { "\\b\\w*ClassName\\b\\s*=\\s*[\"'`]([^\"'`]*)[\"'`]" },
                { "\\b\\w*ClassNames\\b\\s*=\\s*[\"'`]([^\"'`]*)[\"'`]" },
                {
                  "clsx\\(((?:[^()]|\\([^()]*\\))*)\\)",
                  "(?:'|\"|`)([^']*)(?:'|\"|`)",
                },

                {
                  "cn\\(((?:[^()]|\\([^()]*\\))*)\\)",
                  "(?:'|\"|`)([^']*)(?:'|\"|`)",
                },
              },
            },
          },
        },
      },
    },
    features = {
      codelens = true, -- enable/disable codelens refresh on start
      inlay_hints = false, -- enable/disable inlay hints on start
      semantic_tokens = true, -- enable/disable semantic token highlighting
      signature_help = true,
    },
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
      },
    },
    autocmds = {
      lsp_codelens_refresh = {
        -- Optional condition to create/delete auto command group
        -- can either be a string of a client capability or a function of `fun(client, bufnr): boolean`
        -- condition will be resolved for each client on each execution and if it ever fails for all clients,
        -- the auto commands will be deleted for that buffer
        cond = "textDocument/codeLens",
        -- cond = function(client, bufnr) return client.name == "lua_ls" end,
        -- list of auto commands to set
        {
          -- events to trigger
          event = { "InsertLeave", "BufEnter" },
          -- the rest of the autocmd options (:h nvim_create_autocmd)
          desc = "Refresh codelens (buffer)",
          callback = function(args)
            if require("astrolsp").config.features.codelens then vim.lsp.codelens.refresh { bufnr = args.buf } end
          end,
        },
      },
    },
    -- mappings to be set up on attaching of a language server
    mappings = {
      n = {
        -- a `cond` key can provided as the string of a server capability to be required to attach, or a function with `client` and `bufnr` parameters from the `on_attach` that returns a boolean
        gD = {
          function() vim.lsp.buf.declaration() end,
          desc = "Declaration of current symbol",
          cond = "textDocument/declaration",
        },
        ["<Leader>uY"] = {
          function() require("astrolsp.toggles").buffer_semantic_tokens() end,
          desc = "Toggle LSP semantic highlight (buffer)",
          cond = function(client)
            return client.supports_method "textDocument/semanticTokens/full" and vim.lsp.semantic_tokens ~= nil
          end,
        },
      },
    },
    -- A custom `on_attach` function to be run after the default `on_attach` function
    -- takes two parameters `client` and `bufnr`  (`:h lspconfig-setup`)
    on_attach = function(client, bufnr)
      -- this would disable semanticTokensProvider for all clients
      -- client.server_capabilities.semanticTokensProvider = nil
    end,
  },
}
