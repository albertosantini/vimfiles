VIM configuration
=================

This repository contains the configuration of my preferred editor:
[Vim](http://www.vim.org/).

I have been using release 7.4.2015 on Windows 10 64bit: binaries from
[vim-win32-installer](https://github.com/vim/vim-win32-installer).

The standard Vim folders contain the configuration for my programming needs
about color theme, indentation, compiler settings and so on for
[JavaScript](http://nodejs.org/) and [R](http://www.r-project.org/).

## Batteries included

- Statusline configured.
- Basic JavaScript snippets.
- [fugitive](https://github.com/tpope/vim-fugitive) plugin.
- [ctrlp](https://github.com/ctrlpvim/ctrlp.vim) plugin.

## Custom mappings

- `<f4>` next error in quickfix
- `<S-f4>` previous error in quickfix
- `<f6>` next buffer
- `<S-f6>` previous buffer
- `<Leader>e` open netrw
- `<Leader>l` list buffers
- `<Leader>t` browse old files
- `<Leader>w` close buffer
- `<A-j>` move down line(s)
- `<A-k>` move up line(s)
- `<Leader>c` toggle comment line(s)
- `<C-S-P>` show syntax highlight

## Note

Not to override the viminfo file using a terminal version of Vim, when,
for instance, writing a quick and short comment for a commit.

- `export EDITOR="vim -i NONE"`

Don't forget the recursive option to clone the project with the submodules.

- `git clone --recursive https://github.com/albertosantini/vimfiles.git`

Finally to update the submodule.

- `git submodule update --remote --merge`
