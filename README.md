# ru.nvim

My personal Neovim configuration, built from scratch.

The goal is simple: **fast, lightweight, good-looking, and fully understood.**

I previously used LazyVim, but eventually wanted more control over my editor and a better understanding of how everything fits together. `ru.nvim` is my attempt to build that environment myself instead of assembling a large preconfigured distribution.

---

## Features

### Core

* Lua-based configuration
* `lazy.nvim` for plugin management
* Relative line numbers
* 2-space indentation
* Smart case-insensitive searching
* Rounded window borders
* System clipboard integration
* Split windows open to the right/below
* Cursor line highlighting
* Scroll offset for comfortable navigation

### UI

* One Dark Pro
* Bufferline
* Nvim-tree file explorer
* Indent guides with current-scope highlighting
* Rounded floating windows
* LSP diagnostics integrated into the editor

### Editing

* Fast completion with `blink.cmp`
* LSP-powered completion
* Automatic completion documentation
* Format on save with Conform
* Prettier support
* Automatic parentheses, brackets, and quotes
* Automatic HTML/JS/TS closing tags through Treesitter

### AI Completion

[GitHub Copilot](https://github.com/github/copilot.vim) provides asynchronous inline suggestions as ghost text.

Copilot is kept separate from `blink.cmp`:

* `blink.cmp` handles LSP completion
* Copilot handles AI suggestions
* `<CR>` accepts LSP completion
* `<Tab>` accepts Copilot suggestions
* Copilot suggestions use a muted blue-purple color so they remain visible without competing with actual code

Copilot is enabled by default once the plugin is authenticated.

#### Copilot keymaps

```text
<Tab>      Accept the current suggestion
<M-]>      Show the next suggestion
<M-[>      Show the previous suggestion
```

#### Copilot commands

Useful commands provided by `copilot.vim`:

```text
:Copilot setup       For initial setup (authentication and configuration)
:Copilot status      Show Copilot status
:Copilot enable      Enable Copilot
:Copilot disable     Disable Copilot
:Copilot toggle      Toggle Copilot
:Copilot panel       Open the Copilot panel
:Copilot signout     Sign out of GitHub Copilot
```

On a fresh installation, Copilot must be authenticated before suggestions can be generated.

---

## LSP

* `nvim-lspconfig`
* Mason
* Mason LSP config
* Automatic LSP setup
* Lua language server configuration
* Definitions, references, and implementations
* Rename and code actions
* Diagnostic navigation
* Inline diagnostic messages
* Severity-sorted diagnostics

---

## Treesitter

Treesitter is enabled for:

* HTML
* CSS
* JavaScript
* TypeScript
* TSX
* Rust
* C
* C++
* C#
* Python
* Bash
* SQL
* YAML
* Dockerfile
* Lua
* Vim
* Vimdoc
* JSON
* Markdown
* Markdown inline

Docker Compose and GitHub Actions are covered by the YAML parser.

Prisma is intentionally not included yet because its current parser/filetype setup needs to be verified rather than guessed.

---

## Indent Guides

[indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) provides indentation guides throughout the editor.

The current indentation scope is highlighted separately, making nested code easier to follow, especially in languages with deep HTML, JavaScript, and JSX structures.

---

## Search

[Telescope](https://github.com/nvim-telescope/telescope.nvim) is used for:

* File search
* Project-wide grep
* Buffer switching

Searches include hidden files while ignoring noisy directories such as:

* `.git`
* `node_modules`
* `dist`
* `.venv`

---

## Search & Replace

[grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim) provides project and file-level search and replace with a live preview.

Current mappings:

```text
<leader>R   Search and replace across project
<leader>r   Search and replace in current file
```

---

## Git

[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) provides:

* Git change indicators
* Hunk navigation
* Hunk staging
* Hunk resetting
* Hunk preview
* Line blame

---

## File Explorer

[nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) provides a visual sidebar file explorer.

The tree is intentionally kept close to its native behavior, with a few custom mappings:

```text
<leader>e  Toggle file explorer
h          Collapse directory
l          Expand directory / open file
m          Move file
r          Rename
H          Toggle hidden files
a          Create file/directory
d          Delete
R          Refresh
```

Hidden files are shown by default.

---

## Buffers

Buffer navigation:

```text
<S-l>       Next buffer
<S-h>       Previous buffer
<leader>bd  Delete buffer
```

---

# Keymaps

## Window navigation

```text
<C-h>  Move to left split
<C-j>  Move to lower split
<C-k>  Move to upper split
<C-l>  Move to right split
```

## LSP

```text
gd         Go to definition
gr         Find references
gI         Go to implementation

<leader>rn  Rename
<leader>ca  Code action
```

## Diagnostics

```text
[d         Previous diagnostic
]d         Next diagnostic
<leader>d  Show diagnostic
```

## Telescope

```text
<leader><leader>  Find files
<leader>f         Live grep
<leader>bb        Find buffers
```

## Search & Replace

```text
<leader>R   Project search and replace
<leader>r   Current-file search and replace
```

## Splits

```text
<leader>|  Vertical split
<leader>-  Horizontal split
```

## Buffers

```text
<S-l>       Next buffer
<S-h>       Previous buffer
<leader>bd  Delete buffer
```

## Formatting

```text
<C-S-i>  Format code in the current buffer
```

## Git

```text
[c         Previous hunk
]c         Next hunk

<leader>hs  Stage hunk
<leader>hr  Reset hunk
<leader>hp  Preview hunk
<leader>hb  Blame line
```

## Copilot

```text
<Tab>      Accept suggestion
<M-]>      Next suggestion
<M-[>      Previous suggestion
```

## File Explorer

```text
<leader>e  Toggle file explorer

h          Collapse directory
l          Expand directory / open file
m          Move file
r          Rename
H          Toggle hidden files
a          Create file/directory
d          Delete
R          Refresh
```

---

## Clipboard

System clipboard integration is enabled through:

```lua
vim.opt.clipboard = "unnamedplus"
```

On Wayland, `wl-clipboard` provides the clipboard integration.

---

## Installation

Clone the repository into your Neovim configuration directory:

```bash
git clone <repo-url> ~/.config/nvim
```

Then launch:

```bash
nvim
```

`lazy.nvim` bootstraps automatically on first launch.

### Requirements

* Neovim 0.12+
* Git
* A working system clipboard provider
* A Nerd Font is recommended for icons
* `wl-clipboard` on Wayland

---

## Structure

```text
~/.config/nvim/
├── init.lua
├── lazy-lock.json
├── README.md
└── lua/
    ├── config/
    │   ├── keymaps.lua
    │   └── options.lua
    └── plugins/
        ├── autotag.lua
        ├── bufferline.lua
        ├── completion.lua
        ├── explorer.lua
        ├── formatter.lua
        ├── git.lua
        ├── indentguide.lua
        ├── lsp.lua
        ├── replace.lua
        ├── telescope.lua
        ├── theme.lua
        └── treesitter.lua
```

The configuration is intentionally split by responsibility:

* `config/options.lua` — editor options
* `config/keymaps.lua` — global keymaps
* `plugins/` — plugin configuration

---

## Philosophy

`ru.nvim` is built around a few rules:

1. **Understand the tool before configuring it.**
2. **Use native Neovim functionality whenever possible.**
3. **Don't add a plugin just because everyone else uses it.**
4. **Keep configuration small and readable.**
5. **Optimize for actual workflow annoyances.**
6. **Measure performance instead of guessing.**

The goal isn't to recreate someone else's Neovim distribution.

It's to build an editor that feels right because I understand why every piece is there.

---

## Things intentionally avoided

Some popular plugins and approaches are intentionally not part of this setup.

For example:

* Snacks.nvim
* fzf-lua
* Large all-in-one configuration frameworks
* Plugins that duplicate functionality already provided by Neovim or an existing plugin

If something can be solved cleanly with a few lines of native Lua, that's usually preferable.

---

## Future

The configuration is intentionally evolving through actual use rather than a predefined checklist.

Potential additions will be driven by real workflow problems rather than by trying to recreate a "complete" Neovim setup.

