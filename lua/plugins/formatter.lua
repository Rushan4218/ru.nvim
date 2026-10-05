return {
  {
    "stevearc/conform.nvim",

    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },
        markdown = { "prettier" },
        yaml = { "prettier" },
        c = { "clangformat" },
        cpp = { "clangformat" },
      },

      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },

    keys = {
      {
        "<C-S-i>",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "n",
        desc = "Format buffer",
      },
    },
  },
}
