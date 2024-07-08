local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },

    javascript = { "prettierd", "prettier" },
    typescript = { "prettierd", "prettier" },
    css = { "prettierd", "prettier" },
    html = { "prettierd", "prettier" },
    svelte = { "prettierd", "prettier" },
    python = { "black", "isort" },

    sh = { "shfmt" },
    rust = { "rustfmt" },
    dart = { "dart_format" },
    json = { "fixjson" },
    haskell = { "fourmolu" },
    java = { "google-java-format" },
    elixir = { "mix" },
    cpp = { "clang_format" },
    cmake = { "cmake_format" },
  },

  -- adding same formatter for multiple filetypes can look too much work for some
  -- instead of the above code you could just use a loop! the config is just a table after all!

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

require("conform").setup(options)
