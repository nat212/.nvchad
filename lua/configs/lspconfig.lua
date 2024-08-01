local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

require("neodev").setup {
  library = {
    plugins = true,
    types = true,
  },
}
-- require("java").setup()

-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "cssls",
  "tsserver",
  "clangd",
  "svelte",
  "taplo",
  "spectral",
  "rust_analyzer",
  "hls",
  "jdtls",
  "cmake",
  "pylsp",
  "lua_ls",
  "csharp_ls",
}

local server_settings = {
  ["rust_analyzer"] = {
    ["rust-analyzer"] = {
      diagnostics = {
        enable = true,
      },
    },
  },
  ["lua_ls"] = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },
    },
  },
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = server_settings[lsp],
  }
end

-- Setup lexical
lspconfig.lexical.setup {
  cmd = { "start_lexical.sh" },
  filetypes = { "elixir", "eelixir", "heex" },
  root_dir = function(fname)
    return lspconfig.util.root_pattern("mix.exs", ".git")(fname) or vim.loop.os_homedir()
  end,
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {},
}

lspconfig.tailwindcss.setup {
  cmd = {"tailwindcss-language-server", "--stdio"},
  filetypes = {
    "aspnetcorerazor",
    "astro",
    "astro-markdown",
    "blade",
    "clojure",
    "django-html",
    "htmldjango",
    "edge",
    "eelixir",
    "elixir",
    "ejs",
    "erb",
    "eruby",
    "gohtml",
    "gohtmltmpl",
    "haml",
    "handlebars",
    "hbs",
    "html",
    "html-eex",
    "heex",
    "jade",
    "leaf",
    "liquid",
    "markdown",
    "mdx",
    "mustache",
    "njk",
    "nunjucks",
    "php",
    "razor",
    "slim",
    "twig",
    "css",
    "less",
    "postcss",
    "sass",
    "scss",
    "stylus",
    "sugarss",
    "javascript",
    "javascriptreact",
    "reason",
    "rescript",
    "typescript",
    "typescriptreact",
    "vue",
    "svelte",
    "templ",
  },
  init_options = {
    eelixir = "html-eex",
    eruby = "erb",
    templ = "html",
  },
}
