# Install

1. `git clone https://github.com/can3p/vimrc.git ~/.vim`
2. `mkdir ~/.vim/bundle`
3. `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
4. `ln -s ~/.vim/vimrc ~/.vimrc`
5. `vim +PluginInstall`

## PluginInstall or PluginUpdate hang

```
git config --global url."https://github.com/".insteadOf git://github.com/
```

Github has [stopped](https://itsmycode.com/the-unauthenticated-git-protocol-on-port-9418-is-no-longer-supported)
supporting one of the protocols, which might be the reason.

Spaces are used for indentation by default.
