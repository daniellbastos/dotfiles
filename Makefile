start:
	echo "Instaling dependences..."
	@sudo apt-get install vim git build-essential python-dev python3.5-dev
	@sudo apt-get install postgresql-9.5 postgresql-contrib-9.5 postgresql-9.5-postgis-2.2
	@sudo apt-get install postgresql-server-dev-9.5 redis-server
	@sudo pip install virtualenvwrapper flake8
	@mkdir ~/.virtualenvs
	@git clone git@github.com:magicmonty/bash-git-prompt.git ~/.bash-git-prompt
	@ln -s ~/.dotfiles/giticonfig ~/.giticonfig
	@ln -s ~/.dotfiles/gitignore_global ~/.gitignore_global
	@git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	@ln -s ~/.dotfiles/vimrc ~/.vimrc
	@mkdir -p ~/.vim/spell
	@cp ~/.dotfiles/pt.utf-8.spl ~/.vim/spell
	@vim +PluginInstall +qall
	echo "Done."
