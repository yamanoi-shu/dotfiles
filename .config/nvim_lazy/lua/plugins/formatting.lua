return {
  {
    "stevearc/conform.nvim",
    opts = {
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 3000,
      },
      formatters_by_ft = {
        go = { "goimports" },
      },
    },
  },
}
