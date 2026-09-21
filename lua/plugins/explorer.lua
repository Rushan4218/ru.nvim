return {
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local api = require("nvim-tree.api")
      require("nvim-tree").setup({
        filters = {
          dotfiles = false,
          git_ignored = false
        },
        on_attach = function(bufnr)
          api.config.mappings.default_on_attach(bufnr)
          vim.keymap.set("n", "h", api.node.navigate.parent_close, {
            buffer = bufnr,
            noremap = true,
            silent = true
          })
          vim.keymap.set("n", "l", api.node.open.edit, {
            buffer = bufnr,
            noremap = true,
            silent = true
          })
          vim.keymap.set("n", "m", api.fs.move, {
            buffer = bufnr,
            noremap = true,
            silent = true
          })
        end
      })
    end
  }
}
