VIM configuration
=================

This repository contains the configuration of my preferred editor:
[Vim](http://www.vim.org/).

I have been using release 8.x on Windows 10 64bit: binaries from
[vim-win32-installer](https://github.com/vim/vim-win32-installer).

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

- [vim-fugitive](https://github.com/tpope/vim-fugitive) (`git clone https://github.com/tpope/vim-fugitive.git`)
- [ale](https://github.com/w0rp/ale) (`git clone https://github.com/w0rp/ale.git`)

In `z/plugin` there are the configurations of the plugins.

## Note

 Not to override the viminfo file using a terminal version of Vim, when,
for instance, writing a quick and short comment for a commit.

`export EDITOR="vim -i NONE"`
