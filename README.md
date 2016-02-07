Dotfiles
========

This repo has the configurations general my machine.

Git
---

### gitconfig

   ```sh
   ln -s ~/.dotfiles/giticonfig ~/.giticonfig
   ```

### gitignore

   ```sh
   ln -s ~/.dotfiles/gitignore_global ~/.gitignore_global
   ```


Vim
---

### Install Pyflakes

   ```sh
   sudo pip install flake8
   ```

### Install Vandle

   ```sh
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    ln -s ~/.dotfiles/vimrc ~/.vimrc

    vim +PluginInstall +qall
   ```
