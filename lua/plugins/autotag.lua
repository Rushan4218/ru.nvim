return {
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "vue",
      "svelte"
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end
  }
}
