HERE=$(shell readlink -m $(CURDIR))

install: vim bash tmux

update:
	git pull
	
vim: vim-pathogen
	echo "source $(HERE)/vimrc.vim" >> ~/.vimrc
	git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
	echo "source $(HERE)/vimrc-nerdtree.vim" >> ~/.vimrc

vim-pathogen: ~/.vim/autoload/pathogen.vim

~/.vim/autoload/pathogen.vim:
	mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
	echo "execute pathogen#infect()" >> ~/.vimrc

bash:
	echo "source $(HERE)/bashrc.bash" >> ~/.bashrc

tmux:
	echo "source-file $(HERE)/tmuxrc.tmux">> ~/.tmux.conf

