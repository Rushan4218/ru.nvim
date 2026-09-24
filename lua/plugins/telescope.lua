return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},

		opts = {
			defaults = {
				file_ignore_patterns = {
					"^%.git/",
					"node_modules/",
					"dist/",
					"%.venv/",
					"%.next/",
				},
			},

			pickers = {
				find_files = {
					hidden = true,
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
							"!**/node_modules/**",
							"--glob",
							"!**/dist/**",
							"--glob",
							"!**/.venv/**",
							"--glob",
							"!**/.next/**",
						}
					end,
				},
			},
		},
	},
}
