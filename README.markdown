VIM configuration
=================

This repository contains the configuration of my preferred editor:
[Vim](http://www.vim.org/).

I have been using the official binaries (7.3.46) on Windows 7 64 bit.

The user vimrc file, `_vimrc`, is contained in the `plugin` folder as
`vimrc.vim`: so I do not need to link that file to the user home folder.

I don't use any plugin.

The standard vim folders contain the configuration for my programming needs
about color theme, indentation, compiler settings and so on:

- [JavaScript](http://nodejs.org/)
- [R](http://www.r-project.org/)

Note
----

I have been using Git Bash shell for git commands. I set the EDITOR variable to
`vim -i NONE`: so the terminal version of vim does not override the viminfo
file, when, for instance, I write a comment for a commit.
