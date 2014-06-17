VIM configuration
=================

This repository contains the configuration of my preferred editor:
[Vim](http://www.vim.org/).

I have been using release 7.4 on Windows 7 64 bit.

The standard vim folders contain the configuration for my programming needs
about color theme, indentation, compiler settings and so on:

- [JavaScript](http://nodejs.org/)
- [R](http://www.r-project.org/)


## Batteries included

- [fugitive](https://github.com/tpope/vim-fugitive) plugin.
- Statusline configured.

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
- `<Leader>cc` comment line(s)
- `<Leader>cu` uncomment line(s)
- `<C-S-P>` show syntax highlight


## Plugins in the radar

- [delimitMate](https://github.com/Raimondi/delimitMate)
- [surround](https://github.com/tpope/vim-surround)
- [tcomment](https://github.com/tomtom/tcomment_vim)
- [unite](https://github.com/Shougo/unite.vim)
- [vim-airline](https://github.com/bling/vim-airline)
- [vundle](https://github.com/gmarik/vundle)

Note
----

I have been using Git Bash shell for git commands. I set the EDITOR variable to
`vim -i NONE`: so the terminal version of vim does not override the viminfo
file, when, for instance, I write a comment for a commit.

Instead using submodules, vundle package manager is a viable solution.

Anyway I prefer to tweak manually the runtime path.

In `plugin/vimrc.vim` I may add `runtime bundle/bundle.vim` and `bundle.vim` may contain the following setting, for instance:

```
set runtimepath+=~/vimfiles/bundle/tcomment_vim
set runtimepath+=~/vimfiles/bundle/vim-surround

runtime! bundle/**/plugin/*.vim
```
