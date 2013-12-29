VIM configuration
=================

This repository contains the configuration of my preferred editor:
[Vim](http://www.vim.org/).

I have been using the official binaries (7.4) on Windows 7 64 bit.

The user vimrc file, `_vimrc`, is contained in the `plugin` folder as
`vimrc.vim`: so I do not need to link that file to the user home folder.

I don't use any plugin.

The standard vim folders contain the configuration for my programming needs
about color theme, indentation, compiler settings and so on:

- [JavaScript](http://nodejs.org/)
- [R](http://www.r-project.org/)


Plugins in the radar:

- [easymotion](https://github.com/Lokaltog/vim-easymotion)
- [fugitive](https://github.com/tpope/vim-fugitive)
- [delimitMate](https://github.com/Raimondi/delimitMate)
- [numbers](https://github.com/myusuf3/numbers.vim)
- [surround](https://github.com/tpope/vim-surround)
- [tcomment](https://github.com/tomtom/tcomment_vim)
- [unite](https://github.com/Shougo/unite.vim)
- [vim-airline](https://github.com/bling/vim-airline)
- [vim-multiple-cursor](https://github.com/terryma/vim-multiple-cursors)
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
