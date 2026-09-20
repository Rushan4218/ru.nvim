local languages = { "html", "css", "javascript", "typescript", "tsx", "rust", "c", "cpp", "c_sharp", "python", "bash",
  "sql", "yaml", "dockerfile", "lua", "vim", "vimdoc", "json", "markdown", "markdown_inline", }

return { {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local treesitter = require("nvim-treesitter")
    treesitter.setup()
    treesitter.install(languages)
    vim.api.nvim_create_autocmd("FileType", { pattern = languages, callback = function() vim.treesitter.start() end, })
  end,
}, }
