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
- Basic JavaScript snippets.

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


## Plugins in the radar

- [colorscheme-primary](https://github.com/google/vim-colorscheme-primary)
- [delimitMate](https://github.com/Raimondi/delimitMate)
- [neobundle](https://github.com/Shougo/neobundle.vim)
- [surround](https://github.com/tpope/vim-surround)
- [tcomment](https://github.com/tomtom/tcomment_vim)
- [unite](https://github.com/Shougo/unite.vim)
- [vim-airline](https://github.com/bling/vim-airline)
- [vim-plug](https://github.com/junegunn/vim-plug)

Note
----

I have been using Git Bash shell for git commands. I set the `EDITOR` variable to
`vim -i NONE`: so the terminal version of vim does not override the viminfo
file, when, for instance, I write a comment for a commit.

I prefer zero plugin footprint, but, instead using submodules, neobundle package 
manager may be a viable solution.

After adding manually `neobundle` plugin in `bundle` folder, I may create, for 
instance, a `bundle/bundle.vim` file:

```
set runtimepath+=~/vimfiles/bundle/neobundle.vim

call neobundle#begin()

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'

call neobundle#end()

NeoBundleCheck
```

Then add at the top of `vimrc`:

```
runtime! bundle/bundle.vim
```
