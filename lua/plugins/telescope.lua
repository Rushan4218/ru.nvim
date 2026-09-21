return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},

		opts = {
			defaults = {
				-- ignores directories with these patterns
				file_ignore_patterns = {
					"^%.git/",
					"^node_modules/",
					"^dist/",
					"^%.venv/",
          "^%.next/"
				},
			},

			pickers = {
				find_files = {
					-- shows hidden files in the picker
					hidden = true,

					-- shows git ignored files in the picker (eg: .env)
					no_ignore = true,
				},

				live_grep = {
					additional_args = function()
						return {
							"--hidden",
							"--no-ignore",
							"--glob",
							"!.git/**",
							"--glob",
							"!node_modules/**",
							"--glob",
							"!dist/**",
							"--glob",
							"!.venv/**",
              "--glob",
              "!.next/**"
						}
					end,
				},
			},
		},
	},
}
