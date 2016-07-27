this_path=`readlink -m $(dirname $0)`

echo "source $this_path/vimrc.vim" >> ~/.vimrc
echo "source $this_path/bashrc.bash" >> ~/.bashrc
echo "source-file $this_path/tmuxrc.tmux">> ~/.tmux.conf
