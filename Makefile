start:
	echo "Instaling dependences..."
	@sudo apt-get install vim build-essential python-dev
	@sudo pip install virtualenvwrapper flake8
	@mkdir ~/.virtualenvs
	@git clone git@github.com:magicmonty/bash-git-prompt.git ~/.bash-git-prompt
	@ln -s ~/.dotfiles/gitconfig ~/.gitconfig
	@ln -s ~/.dotfiles/gitignore_global ~/.gitignore_global
	@git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	@ln -s ~/.dotfiles/vimrc ~/.vimrc
	@mkdir -p ~/.vim/spell
	@cp ~/.dotfiles/pt.utf-8.spl ~/.vim/spell
	@vim +PluginInstall +qall
	@ls -s ~/.dotfiles/UltiSnips/ ~/.vim/
	echo "Done."
