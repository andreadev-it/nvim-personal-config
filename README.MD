This is just a personal nvim configuration that sets up different things, like:
- LSP
- Telescope
- NeoTree (netrw alternative)
- Github Copilot
- Treesitter
- some esthetics and functionality improvements

First of all: install packer by cloning their git repository to a directory within `packpath` (you can see which directories are available by executing this command in nvim `:set packpath`).

Follow their [github repo](https://github.com/wbthomason/packer.nvim) for more info.

Remember to install all plugins using Packer:
```
:PackerSync
```

And also to install your preferred language servers through LspInstall (jsonls, sumneko_lua and pyright have special configurations):
```
:LspInstall jsonls sumneko_lua pyright ...
```

The code in this configuration is not super-clean, but I'm still working on it. In part it was copied and modified from the [nvim from scratch](https://github.com/LunarVim/Neovim-from-scratch) project and other sources.
