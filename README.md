# Install

0. Install silver searcher
1. `ln -s ~/.vim/vimrc ~/.vimrc`
2. `vim`

To update plugins call `:PlugUpdate`, to update plug call `:PlugUpgrade`

## PlugInstall or PlugUpdate hang

```
git config --global url."https://github.com/".insteadOf git://github.com/
```

Github has [stopped](https://itsmycode.com/the-unauthenticated-git-protocol-on-port-9418-is-no-longer-supported)
supporting one of the protocols, which might be the reason.

Spaces are used for indentation by default.

## Vim 8

Please use vim8 branch
