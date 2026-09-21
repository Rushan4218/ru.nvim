return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",

    opts = {
      indent = {
        char = "│",
      },

      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
        highlight = "IblScope",
      },
    },

    config = function(_, opts)
      vim.api.nvim_set_hl(0, "IblScope", {
        fg = "#8FA7D6",
      })
      require("ibl").setup(opts)
    end,
  },
}
