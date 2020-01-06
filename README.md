VIM configuration
=================

This repository contains the configuration of my preferred editor:
[Vim](http://www.vim.org/).

## Custom mappings

- `<f6>` next buffer
- `<S-f6>` previous buffer
- `<Leader>e` open netrw
- `<Leader>l` list buffers
- `<Leader>t` browse old files
- `<Leader>w` close buffer
- `<A-j>` move down line(s)
- `<A-k>` move up line(s)
- `<Leader>c` toggle comment line(s)

## Plugins

`pack/my/start` folder contains external plugins you need to clone:

- [vim-polyglot](https://github.com/sheerun/vim-polyglot) (`git clone https://github.com/sheerun/vim-polyglot.git`)
- [coc.nvim](https://github.com/neoclide/coc.nvim) (`git clone https://github.com/neoclide/coc.nvim.git`)
- [vim-fugitive](https://github.com/tpope/vim-fugitive) (`git clone https://github.com/tpope/vim-fugitive.git`)

In `z/plugin` there are the configurations of the plugins.
