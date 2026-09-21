return {
  {
    "github/copilot.vim",
    event = "InsertEnter",

    config = function()
      -- enable copilot by default
      vim.g.copilot_enabled = true
      -- custom colors for the Copilot suggestion text
      vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#6B617D" })
    end
  }
}
