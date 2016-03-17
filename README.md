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

    mkdir -p ~/.vim/spell

    cp ~/.dotfiles/pt.utf-8.spl ~/.vim/spell

    vim +PluginInstall +qall
   ```


### Spell Checker

Enable/disable the spell checker ``F5``

Commands | Descriptions
--- | ---
`]s` | Go to the next word
`zg` | Add word
`zw` | Remove word
`z=` | Suggestions
