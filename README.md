VIM configuration
=================

This repository contains the configuration of my preferred editor:
[Vim](http://www.vim.org/).

I have been using release 7.4.1506 on Windows 10 64 bit: binaries from
[vim-win32-installer](https://github.com/vim/vim-win32-installer).

The standard Vim folders contain the configuration for my programming needs
about color theme, indentation, compiler settings and so on for
[JavaScript](http://nodejs.org/) and [R](http://www.r-project.org/).

## Batteries included

- Statusline configured.
- Basic JavaScript snippets.
- [fugitive](https://github.com/tpope/vim-fugitive) plugin.

## Custom mappings

- `<f4>` next error in quickfix
- `<S-f4>` previous error in quickfix
- `<f6>` next buffer
- `<S-f6>` previous buffer
- `<Leader>l` list buffers
- `<Leader>t` browse old files
- `<Leader>w` close buffer
- `<A-j>` move down line(s)
- `<A-k>` move up line(s)
- `<Leader>c` toggle comment line(s)
- `<C-S-P>` show syntax highlight

## Note

I have been using Git Bash shell. I export the `EDITOR` variable to `vim -i
NONE`: so the terminal version of Vim does not override the viminfo file, when,
for instance, I write a comment for a commit.

To fork the project don't forget the recursive option to clone also the
submodules: `git clone --recursive https://github.com/albertosantini/vimfiles.git`
