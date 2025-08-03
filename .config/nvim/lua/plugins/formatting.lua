return {
  {
    "stevearc/conform.nvim",
    opts = {
      -- 保存時にフォーマットを実行
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 3000,
      },
      -- 各ファイルタイプごとのformatter指定
      formatters_by_ft = {
        go = { "goimports" },
      },
    },
  },
}
