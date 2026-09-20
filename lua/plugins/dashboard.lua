local function started_with_directory()
  for _, arg in ipairs(vim.v.argv) do
    if not vim.startswith(arg, "-") and vim.fn.isdirectory(arg) == 1 then
      return true
    end
  end

  return false
end

return {
  {
    "goolord/alpha-nvim",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    opts = function()
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        "",
        "██████╗ ██╗   ██╗",
        "██╔══██╗██║   ██║",
        "██████╔╝██║   ██║",
        "██╔══██╗██║   ██║",
        "██║  ██║╚██████╔╝",
        "╚═╝  ╚═╝ ╚═════╝",
        "",
        "              ru.nvim",
        "",
        "        fast • minimal • yours",
        "",
      }

      dashboard.section.header.opts.hl = "Title"

      dashboard.section.buttons.val = {
        {
          type = "text",
          val = "────────────────────────────────",
          opts = {
            position = "center",
            hl = "Comment",
          },
        },
      }

      dashboard.section.footer.val = {
        "",
        "  Neovim "
          .. vim.version().major
          .. "."
          .. vim.version().minor
          .. "."
          .. vim.version().patch,
        "",
        "Built from scratch.",
      }

      dashboard.section.footer.opts.hl = "Comment"

      return dashboard.config
    end,

    config = function(_, opts)
      local alpha = require("alpha")

      alpha.setup(opts)

      if vim.fn.argc() == 0 or started_with_directory() then
        vim.schedule(function()
          alpha.start(false)
        end)
      end
    end,
  },
}
