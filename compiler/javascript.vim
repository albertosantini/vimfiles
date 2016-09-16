let &l:makeprg=substitute(system('npm bin'), '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '') . '/eslint' . " -f compact"
CompilerSet errorformat=%E%f:\ line\ %l\\,\ col\ %c\\,\ %m,%C%.%#
